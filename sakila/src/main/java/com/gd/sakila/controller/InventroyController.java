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

import com.gd.sakila.service.FilmService;
import com.gd.sakila.service.InventoryService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class InventroyController {
	@Autowired InventoryService inventoryService;
	@Autowired FilmService filmService;
	
	// addInventory form
	@GetMapping("/addInventory")
	public String addInventory(Model model,
								@RequestParam(value = "filmId", required = true) int filmId) {
		
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ filmId : "+filmId);
		Map<String, Object> filmOne = filmService.getFilmOne(filmId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ filmOne : "+filmOne);
		
		model.addAttribute("filmOne", filmOne);
		
		return "addInventory";
	}
	
	// addInventory action
	@PostMapping("addInventory")
	public String addInventory(Model model,
								@RequestParam(value = "filmId", required = true) int filmId,
								@RequestParam(value = "storeId", required = true) int storeId,
								@RequestParam(value = "count", required = true) int count) {
		
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ filmId : "+filmId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ storeId : "+storeId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ count : "+count);
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("filmId", filmId);
		paramMap.put("storeId", storeId);
		paramMap.put("count", count);
		
		inventoryService.addInventory(paramMap);
		
		return "redirect:/admin/getInventoryList";
	}
	@GetMapping("/modifyRentalDate")
	public String modifyRentalDate(@RequestParam(value = "rentalId", required = true) int rentalId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ rentalId : 업데이트 실행"+rentalId);
		inventoryService.modifyReturnDate(rentalId);
		return "redirect:/admin/getInventoryList";
	}
	
	@GetMapping("/getRentalOne")
	public String getRentalOne(Model model,
								@RequestParam(value = "inventoryId", required = true) int inventoryId,
								@RequestParam(value = "title", required = true) String title) {
		
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ inventoryId : "+inventoryId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ title : "+title);
		
		List<Map<String, Object>> rentalList = inventoryService.getRentalOne(inventoryId);
		
		model.addAttribute("inventoryId", inventoryId);
		model.addAttribute("title", title);
		model.addAttribute("rentalList", rentalList);
		
		return "getRentalOne";
	}
	
	@GetMapping("/getInventoryList")
	public String getInventoryList(Model model,
									@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
									@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
									@RequestParam(value = "storeId", defaultValue = "0", required = false) int storeId,
									@RequestParam(value = "searchWord", required = false) String searchWord) {
		
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ currentPage : "+currentPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ rowPerPage : "+rowPerPage);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ storeId : "+storeId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ searchWord : "+searchWord);
		
		// getinventoryList 매개변수(map타입 주입을위한 새로운 Map)
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("currentPage", currentPage);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("storeId", storeId);
		paramMap.put("searchWord", searchWord);

		Map<String, Object> serviceMap = inventoryService.getInventoryList(paramMap);
		
		// view data 주입
		model.addAttribute("inventoryList", serviceMap.get("inventoryList"));
		model.addAttribute("lastPage", serviceMap.get("lastPage"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("storeId", storeId);
		
		return "getInventoryList";
	}
}
