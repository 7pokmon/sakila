package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CustomerService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class CustomerController {
	@Autowired CustomerService customerService;
	
	// 고객상세정보(대여리스트+총지불금액)
	@GetMapping("/getCustomerOne")
	public String getCustomerOne(Model model,
									@RequestParam(value= "customerId", required = true) int customerId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ customerId : "+customerId);
		
		Map<String, Object> serviceMap = customerService.getCustomerOneById(customerId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ serviceMap : "+serviceMap);
		

		model.addAttribute("customerOne", serviceMap.get("customerOne"));
		model.addAttribute("rentalListByCustomer", serviceMap.get("rentalListByCustomer"));
		return "getCustomerOne";
	}
	
	// 고객리스트 출력(검색+페이징+직영점별..)
	@GetMapping("/getCustomerList")
	public String getCustomerList(Model model,
									@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
									@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
									@RequestParam(value = "storeId", defaultValue = "0", required = false) int storeId,
									@RequestParam(value = "searchWord", required = false) String searchWord) {
		
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ currentPage : "+currentPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ rowPerPage : "+rowPerPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ storeId : "+storeId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ searchWord : "+searchWord);
		
		// getCustomerList 매개변수(map타입 주입을위한 새로운 Map)
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("currentPage", currentPage);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("storeId", storeId);
		paramMap.put("searchWord", searchWord);
		
		Map<String, Object> serviceMap = customerService.getCustomerList(paramMap);
		
		// view data 주입
		model.addAttribute("customerList", serviceMap.get("customerList"));
		model.addAttribute("lastPage", serviceMap.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("storeId", storeId);
		
		return "getCustomerList";
	}
}
