package com.gd.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.RentalService;
import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.StaffList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class RentalController {
	@Autowired RentalService rentalService;
	@Autowired StaffService staffService;
	
	@GetMapping("/addRental")
	public String addRental(Model model,
							@RequestParam(value = "storeId", required = false) int storeId,
							@RequestParam(value = "customerId", required = false) int customerId) {
		
		log.debug(null);
		
		List<StaffList> staffList = staffService.getStaffList(storeId);
		
		model.addAttribute("customerId", customerId);
		model.addAttribute("staffList", staffList);
		return "addRental";
	}
	@PostMapping("/addRental")
	public String addRental(@RequestParam(value="customerId", required = true) int customerId,
							@RequestParam(value="staffId", required = true) int staffId,
							@RequestParam(value="inventoryId", required = true) int inventoryId,
							@RequestParam(value="amount", required = true) double amount) {
		
		
		// 대여중이면 되돌아가기
		int row = rentalService.overlapInventoryId(inventoryId);
		if(row != 0) {
			return "addRental";
		}
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("customerId", customerId);
		paramMap.put("staffId", staffId);
		paramMap.put("inventoryId", inventoryId);
		paramMap.put("amount", amount);
		
		rentalService.addRentalAndPayment(paramMap);
		
		return "redirect:/admin/getCustomerOne?customerId="+customerId;
	}
}
