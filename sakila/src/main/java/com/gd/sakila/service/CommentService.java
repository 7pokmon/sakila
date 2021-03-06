package com.gd.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.sakila.mapper.CommentMapper;
import com.gd.sakila.vo.Comment;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CommentService {
	@Autowired CommentMapper commentMapper;
	
	// removeComment Service
	public int removeComment(int commentId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ removeComment() : "+commentId);
		return commentMapper.deleteCommentByCommentId(commentId);
	}
	// addComment Service
	public int addComment(Comment comment) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ addComment() : "+comment.toString());
		return commentMapper.insertComment(comment);
	}
}
