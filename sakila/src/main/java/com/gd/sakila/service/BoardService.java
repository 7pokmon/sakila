package com.gd.sakila.service;

import java.io.File;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.mapper.BoardfileMapper;
import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.BoardForm;
import com.gd.sakila.vo.Boardfile;
import com.gd.sakila.vo.Comment;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired CommentMapper commentMapper;
	@Autowired BoardfileMapper boardfileMapper;
	
	// modifyBoard Service
	public int modifyBoard(Board board){
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ modifyBoard() : "+board.toString());
		return boardMapper.updateBoard(board);
	}
	
	// removeBoard Service -> deleteBoard() & deleteCommentByBoardId() transaction
	public int removeBoard(Board board) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ removeBoard() : "+board.toString()); // Board(boardId=?, boardPw=?, boardTitle=null, boardContent=null, staffId=?, insertDate=null, lastUpdate=null)
		
		//  1) 게시글삭제 FK지정하지않은경우
		int boardRow = boardMapper.deleteBoard(board);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ removeBoard() boardRow : "+boardRow);
		if(boardRow == 0) {
			return 0;
		}
		
		//  2) 댓글삭제
		int commentRow = commentMapper.deleteCommentByBoardId(board.getBoardId());
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ removeBoard() commentRow : "+commentRow);
		
		
		
		// 3) 물리적 파일 삭제(/resource/안에 파일)
		List<Boardfile> boardfileList = boardfileMapper.selectBoardfileByBoardId(board.getBoardId());
		if(boardfileList != null) {
			for(Boardfile f : boardfileList) {
				File temp = new File(""); // 프로젝트 폴더에 빈파일이 만들어진다
				String path = temp.getAbsolutePath(); // 프로젝트 폴더
				File file = new File(path+"\\src\\main\\webapp\\resource\\"+f.getBoardfileName());
				file.delete();
			}
		}
				
		// 4) 파일 테이블 행삭제
		int boardfileRow = boardfileMapper.deleteBoardfileByBoardId(board.getBoardId());

		
		return boardRow;
	}
	
	// addBoard Service
	// 추가 엑션
	public void addBoard(BoardForm boardForm) {
		//boardFrom  --> board, boardfile
				log.debug("boardForm :"+boardForm);
				
				// 1)
				Board board = boardForm.getBoard(); // boardId값이 null
				log.debug("board :"+board.getBoardId()); // 0
				boardMapper.insertBoard(board); 
				// 입력시 만들어진 key값을 리턴받아야 한다. -> 리턴받을수 없다. -> 매개변수 board의 boardId값 변경해준다.
				log.debug("board :"+board.getBoardId()); // auto increment로 입력된 값
				
				// 2)
				List<MultipartFile> list = boardForm.getBoardfile();
				if(list != null) {
					for(MultipartFile f : list) {
						Boardfile boardfile = new Boardfile();
						boardfile.setBoardId(board.getBoardId()); // auto increment로 입력된 값
						// test.txt -> newname.txt
						String originalFilename = f.getOriginalFilename();
						int p = originalFilename.lastIndexOf("."); // 4
						String ext = originalFilename.substring(p).toLowerCase(); // .txt
						String prename = UUID.randomUUID().toString().replace("-", "");
						
						String filename = prename+ext;
						boardfile.setBoardfileName(filename); // 이슈>>>> 중복으로 인해 덮어쓰기 가능
						boardfile.setBoardfileSize(f.getSize());
						boardfile.setBoardfileType(f.getContentType());
						log.debug("boardfile :"+boardfile);
						// 2-1)
						boardfileMapper.insertBoardfile(boardfile);
						
						// 2-2)
						// 파일을 저장
						try {
							File temp = new File(""); // 프로젝트 폴더에 빈파일이 만들어진다 
							String path = temp.getAbsolutePath(); // 프로젝트 폴더
							f.transferTo(new File(path+"\\src\\main\\webapp\\resource\\"+filename));
						} catch (Exception e) {
							throw new RuntimeException();
						} 
					}
				}

			}
	
	
	// getBoardOne Service
	public Map<String, Object> getBoardOne(int boardId) {
		
		// 1-1) 상세보기
		Map<String, Object> boardMap = boardMapper.selectBoardOne(boardId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ boardMap : "+boardMap);
		// 1-2) boardfile list
		List<Boardfile> boardfileList = boardfileMapper.selectBoardfileByBoardId(boardId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ boardfileList : "+boardfileList);
		// 2) 댓글 목록
		List<Comment> commentList = commentMapper.selectCommentListByBoard(boardId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ commentList size() : "+commentList.size());
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardMap", boardMap);
		map.put("boardfileList", boardfileList);
		map.put("commentList", commentList);
		return map;
	}
	
	// getBoardList Service
	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord) {
		// 1. 전체페이지 불러와서 마지막페이기 가공
		int boardTotal = boardMapper.selectBoardTotal(searchWord); // searchWord
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ boardTotal"+boardTotal);
		
		int lastPage = (int)(Math.ceil((double)boardTotal / rowPerPage));
		/*
			int lastPage = boardTotal / rowPerPage;
			if(boardTotal % rowPerPage != 0) {
				lastPage += 1;
			}
		*/
		
		
		// 2.  검색어+페이징
		Page page = new Page();
		page.setBeginRow((currentPage - 1) * rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ 검색어+페이징"+page);
		
		// 3.
		List<Board> boardList = boardMapper.selectBoardList(page); // Page
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lastPage", lastPage);
		map.put("boardList", boardList);
		
		return map;
	}
}
