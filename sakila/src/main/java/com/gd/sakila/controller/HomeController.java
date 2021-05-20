package com.gd.sakila.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.sakila.service.StaffService;
import com.gd.sakila.vo.Staff;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {
	@Autowired StaffService staffService;
	// Logger log = LoggerFactory.getLogger(this.getClass()); //(HomeController.class)
	
	// home view
	@GetMapping({"/", "/home", "/index"})
	public String home() {
		// System.out.println("HomeController진입.. home");
		log.debug("test");
		return "home"; // 로그인
	}
	// 로그인
	@PostMapping("login")
	public String login(HttpSession session, Staff staff) { 
		log.debug(""+staff.toString());
		
		Staff loginStaff = staffService.login(staff);
		log.debug(""+loginStaff);
		
		if(loginStaff != null) { // 로그인 성공
			session.setAttribute("loginStaff", loginStaff);
		} 
		return "redirect:/";
		
	}
	// 로그아웃
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
