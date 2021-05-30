package com.gd.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CustomerMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	
	public void modifyCustomerActiveByScheduler() {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ modifyCustomerActiveByScheduler() 실행");
		int row = customerMapper.updateCustomerActiveByScheduler();
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ 휴면고객 처리 행수 : "+row);
	}
	
	public Map<String, Object> getCustomerList(Map<String, Object> paramMap) {
		log.debug("currentPage : "+paramMap.get("currentPage"));
		log.debug("rowPerPage : "+paramMap.get("rowPerPage"));
		log.debug("searchWord : "+paramMap.get("searchWord"));
		log.debug("storeId : "+paramMap.get("storeId"));
		
		int currentPage = (Integer)(paramMap.get("currentPage"));
		int rowPerPage = (Integer)(paramMap.get("rowPerPage"));
		int beginRow = (currentPage - 1) * rowPerPage;
		
		
		
		log.debug("beginRow : "+beginRow);
		// paraMap beginRow 주입
		paramMap.put("beginRow", beginRow);
		
		int customerTotal = customerMapper.selectCustomerTotal(paramMap);
		int lastPage = (int)(Math.ceil((double)customerTotal / rowPerPage));
		log.debug("customerTotal : "+customerTotal);
		log.debug("lastPage : "+lastPage);
		
		List<Map<String, Object>> customerList = customerMapper.selectCustomerList(paramMap);
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("customerList", customerList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
	
	// 고객상세정보(대여리스트+총지불금액)
	public Map<String, Object> getCustomerOneById(int customerId){
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ customerId : "+customerId);
		
		Map<String, Object> customerOne = customerMapper.selectCustomerOneById(customerId);
		List<Map<String, Object>> rentalListByCustomer = customerMapper.selectRentalListByCustomer(customerId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ customerOne : "+customerOne);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ rentalListByCustomer : "+rentalListByCustomer);
		
		Map<String, Object> returnMap = new HashMap<>();
		returnMap.put("customerOne", customerOne);
		returnMap.put("rentalListByCustomer", rentalListByCustomer);
		
		return returnMap;
	}
}
