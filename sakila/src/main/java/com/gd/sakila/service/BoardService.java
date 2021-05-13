package com.gd.sakila.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.sakila.mapper.BoardMapper;
import com.gd.sakila.vo.*;

@Service
public class BoardService {
	@Autowired
	BoardMapper boardMapper;
	
	// addBoard Service
	public int addBoard(Board board) {
		return boardMapper.insertBoard(board);
	}
	
	// getBoardOne Service
	public Map<String, Object> getBoardOne(int boardId) {
		return boardMapper.selectBoardOne(boardId);
	}
	
	// getBoardList Service
	public Map<String, Object> getBoardList(int currentPage, int rowPerPage, String searchWord) {
		// 1. 전체페이지 불러와서 마지막페이기 가공
		int boardTotal = boardMapper.selectBoardTotal(searchWord); // searchWord
		System.out.println(boardTotal+" <--boardTotal");
		
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
		System.out.println(page+" <--검색어+페이징");
		
		// 3.
		List<Board> boardList = boardMapper.selectBoardList(page); // Page
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lastPage", lastPage);
		map.put("boardList", boardList);
		
		return map;
	}
}
