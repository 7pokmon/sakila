package com.gd.sakila.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.ActorService;
import com.gd.sakila.vo.Actor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class ActorController {
	@Autowired ActorService actorService;
	
	// 배우 추가 form
	@GetMapping("/addActor")
	public String addActor() {
		return "addActor";
	}
	// 배우 추가 action
	@PostMapping("/addActor")
	public String addActor(Actor actor) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ actor : "+actor);
		actorService.addActor(actor);
		
		return "redirect:/admin/getActorList";
	}
	
	// actor view
	@GetMapping("/getActorList")
	public String getActorList(Model model,
								@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
								@RequestParam(value = "searchWord", required = false) String searchWord) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ currentPage : "+currentPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ rowPerPage : "+rowPerPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ searchWord : "+searchWord);
		
		Map<String, Object> map = actorService.selectActorInfoList(currentPage, rowPerPage, searchWord);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("actorInfoList", map.get("actorInfoList"));
		
		return "getActorList";
	}
}
