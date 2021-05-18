package com.gd.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CommentService;
import com.gd.sakila.vo.Board;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class CommentController {
	@Autowired CommentService commentService;
	
	// 댓글 추가 action
	@PostMapping("/addComment")
	public String addComment(@RequestParam(value = "boardId", required = true) int boardId, Comment comment) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ addComment() comment : "+comment.toString());
		commentService.addComment(comment);
		return "redirect:/admin/getBoardOne?boardId="+boardId; // 일치한boardId getBoardOne 돌아가기
	}
	
	// 댓글 삭제
	@GetMapping("/removeComment")
	public String removeComment(@RequestParam(value = "commentId", required = true) int commentId,
								@RequestParam(value = "boardId", required = true) int boardId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ removeComment() commentId : "+commentId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ removeComment() boardId : "+boardId);
		commentService.removeComment(commentId);
		return "redirect:/admin/getBoardOne?boardId="+boardId; // 일치한boardId getBoardOne 돌아가기
	}
}
