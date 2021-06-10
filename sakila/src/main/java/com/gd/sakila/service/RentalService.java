package com.gd.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.PaymentMapper;
import com.gd.sakila.mapper.RentalMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class RentalService {
	@Autowired RentalMapper rentalMapper;
	@Autowired PaymentMapper paymentMapper;
	
	// 대여 중복 검사 Service
	public int overlapInventoryId(int inventoryId) {
		log.debug("overlapInventoryId() inventoryId : "+inventoryId);
		// 대여중이면 1 아니면 0
		int row = rentalMapper.selectOverlapInventoryId(inventoryId).size();
		return row;
	}
	
	// 영화대여(Rental,Payment 트랜잭션) Sevice
	public void addRentalAndPayment(Map<String, Object> paramMap) {
		log.debug("addRentalAndPayment() paramMap : "+paramMap);
		
		rentalMapper.insertRental(paramMap);
		paymentMapper.insertPayment(paramMap);
	}
	
	// 월별 rental Service
	public List<Integer> getRentalMonthCnt(int year){
		return rentalMapper.selectRentalMonthCnt(year);
	}
}
