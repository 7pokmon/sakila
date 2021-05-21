package com.gd.sakila.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.sakila.mapper.BoardfileMapper;
import com.gd.sakila.vo.Boardfile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class BoardfileService {
	@Autowired BoardfileMapper boardfileMapper;
	
	public int removeboardfileOne(Boardfile boardfile) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ removeboardfileOne() : "+boardfile);
		// 1) 물리적 파일 삭제
		File temp = new File("");
		String path = temp.getAbsolutePath();
		File file = new File(path + "\\src\\main\\webapp\\resource\\" + boardfile.getBoardfileName());
		if(file.exists()) {
			log.debug("if() 삭제진입");
			file.delete();
		}
		
		// 2) db 삭제
		int row = boardfileMapper.deleteBoardfileOne(boardfile);
		
		return row;
	}
	public int addBoardfile(MultipartFile multipartFile, int boardId) {

		// 1) 물리적 파일 저장
		
		File temp = new File("");
		String path = temp.getAbsolutePath(); // 프로젝트 경로
		// 확장자
		int p = multipartFile.getOriginalFilename().lastIndexOf(".");
		String ext = multipartFile.getOriginalFilename().substring(p);
		// 확장자를 제외한 파일이름
		String prename = UUID.randomUUID().toString().replace("-", "");
		
		File file = new File(path + "\\src\\main\\webapp\\resource\\" + prename+ext);
		
		try {
			multipartFile.transferTo(file); // multipartFile안에 파일을 빈file로 복사
		} catch(Exception e) {
			throw new RuntimeException();
		}

		// 2) db 저장
		Boardfile boardfile = new Boardfile();
		boardfile.setBoardId(boardId);
		boardfile.setBoardfileName(prename+ext);
		boardfile.setBoardfileSize(multipartFile.getSize());
		boardfile.setBoardfileType(multipartFile.getContentType());
		
		int row = boardfileMapper.insertBoardfile(boardfile);

		return row;
	}
}
