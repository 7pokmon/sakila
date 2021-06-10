package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.InventoryMapper;
import com.gd.sakila.mapper.PaymentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class InventoryService {
	@Autowired InventoryMapper inventoryMapper;
	@Autowired PaymentMapper paymentMapper;
	
	// insertInventory Service 
	public void addInventory(Map<String, Object> paramMap) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ addInventory() paramMap : "+paramMap);
		
		int count = (Integer)paramMap.get("count");
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ addInventory() count : "+count);
		
		// count 횟수만큼 반복해서 재고추가
		for(int i=0; i<count; i++) {
			inventoryMapper.insertInventory(paramMap);
		}	
	}
	
	// updateReturnDate + updatePayment Service
	public void modifyReturnDate(Map<String, Object> paramMap) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ modifyReturnDate() paramMap : "+paramMap);

		int rentalId = (Integer)paramMap.get("rentalId");
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ modifyReturnDate() rentalId : "+rentalId);
		// 반납
		inventoryMapper.updateReturnDate(rentalId);
		// 반납후 payment table amount 수정
		paymentMapper.updateAmount(paramMap);
	}
	
	// inventoryId : rentalList Service
	public List<Map<String, Object>> getRentalOne(int inventoryId){
		
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ getRentalOne() inventoryId : "+inventoryId);
		
		List<Map<String, Object>> rentalList = inventoryMapper.selectRentalOne(inventoryId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ getRentalOne() rentalList : "+rentalList);
		
		return rentalList;
	}
	
	// inventoryList Service
	public Map<String, Object> getInventoryList(Map<String, Object> paramMap){
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ getInventoryList() currentPage : "+paramMap.get("currentPage"));
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ getInventoryList() rowPerPage : "+paramMap.get("rowPerPage"));
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ getInventoryList() searchWord : "+paramMap.get("searchWord"));
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ getInventoryList() storeId : "+paramMap.get("storeId"));
		
		int currentPage = (Integer)(paramMap.get("currentPage"));
		int rowPerPage = (Integer)(paramMap.get("rowPerPage"));
		int beginRow = (currentPage - 1) * rowPerPage;
		
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ getInventoryList() rentalList : beginRow : "+beginRow);
		// paraMap beginRow 주입
		paramMap.put("beginRow", beginRow);
		
		// 총 페이지수 + 마지막페이지 구하기
		int inventoryTotal = inventoryMapper.selectInventoryTotal(paramMap);
		int lastPage = (int)(Math.ceil((double)inventoryTotal / rowPerPage));
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ getInventoryList() inventoryTotal : "+inventoryTotal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ getInventoryList() lastPage : "+lastPage);
		
		List<Map<String, Object>> inventoryList = inventoryMapper.selectInventoryList(paramMap);
		
		// 리스트, 마지막페이지 주입
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("inventoryList", inventoryList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
}
