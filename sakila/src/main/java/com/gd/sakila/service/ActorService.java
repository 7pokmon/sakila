package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.ActorMapper;
import com.gd.sakila.vo.Actor;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ActorService {
	@Autowired ActorMapper actorMapper;
	
	// addActor Service
	public int addActor(Actor actor) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ actor : "+actor);
		return actorMapper.insertActor(actor);
	}
	
	public Map<String, Object> selectActorInfoList(int currentPage, int rowPerPage, String searchWord) {
		// 전체페이지 불러와서 마지막페이지 가공
		int actorInfoTotal = actorMapper.selectActorInfoTotal(searchWord);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ actorInfoTotal : "+actorInfoTotal);
		
		int lastPage = (int)(Math.ceil((double)actorInfoTotal / rowPerPage));
		
		// 검색어 + 페이징
		Page page = new Page();
		page.setBeginRow((currentPage - 1) * rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ 검색어+페이징"+page);
		
		List<Map<String, Object>> actorInfoList = actorMapper.selectActorInfoList(page);
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("actorInfoList", actorInfoList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
}
