package com.gd.sakila;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gd.sakila.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component // 빈

public class SakilaScheduler {
	@Autowired CustomerService customerService;
	
	// Scheduled 메서드 void반환, 매개변수 0개
	@Scheduled(cron = "0 0 0 1 * * ") // 디폴트값 *(초) *(분) *(시간) *(일) *(월) *(요일) *(년도) 마지막 생략가능
	// 0 0 0 = 24시(00시00분00초), 1 = 1일, * = 매달, * = 요일은 상관없음 
	public void modifyCustomerActive() {
		customerService.modifyCustomerActiveByScheduler();
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ modifyCustomerActive() 스케줄러 실행 완료");
	}
}
