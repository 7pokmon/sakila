package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CategoryMapper;
import com.gd.sakila.mapper.FilmMapper;
import com.gd.sakila.vo.FilmList;
import com.gd.sakila.vo.Page;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper filmMapper;
	@Autowired CategoryMapper categoryMapper;
	
	// getFilmOne Service
	public Map<String, Object> getFilmOne(int FID){
		
		// 1) 상세보기
		Map<String, Object> map = filmMapper.selectFilmOneByFID(FID);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ filmOne() map : "+map);
		
		return map;
	}
	
	// 가게 필름 재고 프로시저 Service
	public int getFilmCount(int filmId, int storeId){
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ filmId : "+filmId); 
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ storeId : "+storeId); 
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("filmId", filmId); 				// 프로시저 in 매개변수
		paramMap.put("storeId", storeId);				//프로시저 in 매개변수
		int filmCount = 0;								//프로시저 out 매개변수
		paramMap.put("filmCount", filmCount);
		
		List<Integer> list = filmMapper.selectFilmInStock(paramMap);	// 프로시저 실행
		filmCount = (int) paramMap.get("filmCount");					// 프로시저에서 out매개변수 filmCount 추출
		log.debug(" filmCount :"+filmCount);
		log.debug(" list :"+list);
			
		return filmCount;
	}
	
	
	// getFilmList Service
	public Map<String, Object> getFilmList(String categoryVal, 
											String priceVal,
											String ratingVal, 
											String titleVal,
											String actorsVal,
											int currentPage,
											int rowPerPage) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ categoryVal : "+categoryVal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ priceVal : "+priceVal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ ratingVal : "+ratingVal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ titleVal : "+titleVal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ actorsVal : "+actorsVal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ currentPage : "+currentPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ rowPerPage : "+rowPerPage);
		
		int beginRow = (currentPage - 1) * rowPerPage;
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ beginRow : "+beginRow);
		
		// paramMap 데이터가공
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("categoryVal", categoryVal);
		paramMap.put("priceVal", priceVal);
		paramMap.put("ratingVal", ratingVal);
		paramMap.put("titleVal", titleVal);
		paramMap.put("actorsVal", actorsVal);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		List<Map<String, Object>> filmList = filmMapper.selectFilmList(paramMap);
		
		// 결과에따른 행의수
		int filmTotal = filmMapper.selectFilmTotal(paramMap);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ filmTotal : "+filmTotal);
		
		// 마지막 페이지 가공
		int lastPage = (int)(Math.ceil((double)filmTotal / rowPerPage));
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ lastPage : "+lastPage);
		
		List<String> categoryNameList = categoryMapper.selectCategoryNameList();
		List<String> ratingList = filmMapper.selectRatingList();
		List<String> priceList = filmMapper.selectPriceList();
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("filmList", filmList);
		returnMap.put("categoryNameList", categoryNameList);
		returnMap.put("ratingList", ratingList);
		returnMap.put("priceList", priceList);
		returnMap.put("lastPage", lastPage);
		return returnMap;
	}
	/*
	public Map<String, Object> getFilmList(int currentPage, int rowPerPage, String searchWord) {
		// 1. 전체페이지 불러와서 마지막페이지 가공
		int filmTotal = filmMapper.selectFilmTotal(searchWord);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ filmTotal : "+filmTotal);
		
		// lastPage 가공
		int lastPage = (int)(Math.ceil((double)filmTotal / rowPerPage));
		
		// 2. 검색어+페이징
		Page page = new Page();
		page.setBeginRow((currentPage - 1) * rowPerPage);
		page.setRowPerPage(rowPerPage);
		page.setSearchWord(searchWord);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ 검색어+페이징 : "+page);
		
		// 3. map에 주입
		List<FilmList> filmList = filmMapper.selectFilmList(page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lastPage", lastPage);
		map.put("filmList", filmList);
	
		return map;
	}
	*/
}
