package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.service.BoardfileService;
import com.gd.sakila.vo.Boardfile;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class BoardfileController {
	@Autowired BoardfileService boardfileService;
	
	// 선택된 파일삭제
	@GetMapping("removeBoardfile")
	public String removeBoardfile(Boardfile boardfile) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ removeBoardfileOne() boardfileId : "+boardfile.getBoardfileId());
		boardfileService.removeboardfileOne(boardfile);
		return "redirect:/admin/getBoardOne?boardId="+boardfile.getBoardId();
	}
	
	// 동일한 게시판ID 파일생성 form
	@GetMapping("addBoardfile")
	public String addBoardfile(Model model, @RequestParam(value = "boardId", required = true) int boardId) {
		
		model.addAttribute("boardId", boardId);
		return "addBoardfile";
	}
	// 동일한 게시판ID 파일생성 action
	@PostMapping("addBoardfile")
	public String addBoardfile(MultipartFile multipartFile, @RequestParam(value = "boardId", required = true) int boardId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ addBoardfile() boardId"+boardId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ addBoardfile() multipartFile"+multipartFile);
		boardfileService.addBoardfile(multipartFile, boardId);
		return "redirect:/admin/getBoardOne?boardId="+boardId;
	}
}
