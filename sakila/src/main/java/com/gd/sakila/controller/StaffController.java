package com.gd.sakila.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.StaffForm;
import com.gd.sakila.vo.StaffList;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class StaffController {
	@Autowired StaffService staffService;
	
	// addStaff + address form
	@GetMapping("/addStaff")
	public String addStaff() {
		return "addStaff";
	}
	// addStaff + address action
	@PostMapping("/addStaff")
	public String addStaff(StaffForm staffForm) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ staffForm : "+staffForm);
		staffService.addStaff(staffForm);
		return "redirect:/admin/getStaffList";
	}
	
	@GetMapping("/getStaffList")
	public String getStaffList(Model model,
							   @RequestParam(value = "storeId", defaultValue = "0") int storeId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ getStaffList() storeId : "+storeId);
		
		List<StaffList> staffList = staffService.getStaffList(storeId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ getStaffList() staffList : "+staffList.toString());
		
		model.addAttribute("storeId", storeId);
		model.addAttribute("staffList", staffList);
		
		return "getStaffList";
	}
}
