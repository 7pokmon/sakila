package com.gd.sakila.controller;




import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class HomeController {
	// Logger log = LoggerFactory.getLogger(this.getClass()); //(HomeController.class)
	
	@GetMapping({"/", "/home", "/index"})
	public String home() {
		// System.out.println("HomeController진입.. home");
		log.debug("test");
		
		return "home";
	}
}
