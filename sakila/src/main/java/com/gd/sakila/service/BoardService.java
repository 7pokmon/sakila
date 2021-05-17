package com.gd.sakila.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.*;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardService {
	@Autowired BoardMapper boardMapper;
	@Autowired CommentMapper commentMapper;
	
	// modifyBoard Service
	public int modifyBoard(Board board){
		log.debug("------ >> modifyBoard() : "+board.toString());
		return boardMapper.updateBoard(board);
	}
	
	// removeBoard Service
	public int removeBoard(Board board) {
		log.debug("------ >> removeBoard() : "+board.toString()); // Board(boardId=?, boardPw=?, boardTitle=null, boardContent=null, staffId=?, insertDate=null, lastUpdate=null)
		return boardMapper.deleteBoard(board);
	}
	
	// addBoard Service
	public int addBoard(Board board) {
		return boardMapper.insertBoard(board);
	}
	
	// getBoardOne Service
	public Map<String, Object> getBoardOne(int boardId) {
		
		// 1) 상세보기
		Map<String, Object> boardMap = boardMapper.selectBoardOne(boardId);
		log.debug("boardMap : "+boardMap);
		// 2) 댓글 목록
		List<Comment> commentList = commentMapper.selectCommentListByBoard(boardId);
		log.debug("commentList size() : "+commentList.size());
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardMap", boardMap);
		map.put("commentList", commentList);
		return map;
	}
	
	// getBoardList Service
	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord) {
		// 1. 전체페이지 불러와서 마지막페이기 가공
		int boardTotal = boardMapper.selectBoardTotal(searchWord); // searchWord
		log.debug(boardTotal+" <--boardTotal");
		
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
		log.debug(page+" <--검색어+페이징");
		
		// 3.
		List<Board> boardList = boardMapper.selectBoardList(page); // Page
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lastPage", lastPage);
		map.put("boardList", boardList);
		
		return map;
	}
}
