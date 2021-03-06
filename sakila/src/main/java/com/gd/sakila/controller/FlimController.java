package com.gd.sakila.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.sakila.service.CategoryService;
import com.gd.sakila.service.FilmService;
import com.gd.sakila.service.LanguageService;
import com.gd.sakila.vo.Category;
import com.gd.sakila.vo.FilmForm;
import com.gd.sakila.vo.Language;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class FlimController {
	@Autowired FilmService filmService;
	@Autowired LanguageService languageService;
	@Autowired CategoryService categoryService;	
	
	// 영화 수정 form
	@GetMapping("/modifyFilm")
	public String modifyFilm(Model model,
								@RequestParam(value = "filmId", required = true) int filmId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ filmId : "+filmId);
		
		Map<String, Object> filmOne = filmService.getFilmOne(filmId);
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ filmOne : "+filmOne);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ categoryList : "+categoryList);
		
		model.addAttribute("filmId", filmId);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("filmOne", filmOne);
		
		return "modifyFilm";
	}
	// 영화 수정 action
	@PostMapping("/modifyFilm")
	public String modifyFilm(FilmForm filmForm) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ filmForm : "+filmForm);
		int filmId = filmService.modifyFilm(filmForm);
		
		return "redirect:/admin/getFilmOne?FID="+filmId;
	}
	
	
	// 영화 추가 form
	@GetMapping("/addFilm")
	public String addFilm(Model model) {
		// categoryList
		// ratingList
		// languageList
		List<Category> categoryList = categoryService.getCategoryList();
		List<Language> languageList = languageService.getLanguageList();
	
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("languageList", languageList);
		
		return "addFilm";
	}
	
	// 영화 추가 action
	@PostMapping("/addFilm")													// 기본(값)타입 매개변수의 이름과 name이 같으면 맵핑
	public String addFilm(FilmForm filmForm) {									// 참조타입은 필드명과 name이 같은면 맵핑
		int filmId = filmService.addFilm(filmForm);
		
		return "redirect:/admin/getFilmOne?FID="+filmId;
	}
	
	
	// 배우 체크박스 리스트
	@GetMapping("/getCheckActorList")
	public String getCheckActorList(Model model,
									@RequestParam(value = "FID", required = true) int FID) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ FID : "+FID);
		
		Map<String, Object> map = filmService.selectActorList(FID);
		model.addAttribute("actorList", map.get("actorList"));
		model.addAttribute("FID", FID); // 상세정보 돌아가기
		
		return "getCheckActorList";
	}
	// 출연배우 수정 (삭제후 추가)
	@PostMapping("modifyCheckActor")
	public String modifyCheckActor(@RequestParam(value = "FID", required = true) int FID,
									@RequestParam(value = "ck") int[] ck) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ FID : "+FID);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ checked ck.length : "+ck.length);
		// service - mapper
		// DELETE FROM film_actor WHERE film_id = #{FID}
		/* 
		 for(int i=0; i<${ck.length}; i++){
				INSERT INTO(actor_id, film_id) VALUES(#{ck}, #{FID})
			}
		*/		
		filmService.modifyCheckActor(ck, FID);
		
		return "redirect:/admin/getFilmOne?FID="+FID;
	}
	
	// 영화 상세보기+프로시저
	@GetMapping("getFilmOne")
	public String getFilmOne(Model model,
								@RequestParam(value = "FID", required = true) int FID) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ FID : "+FID);
		
		// filmOne
		Map<String, Object> flimOne = filmService.getFilmOne(FID);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ flimOne : "+flimOne);
		// 프로시저 (1호점, 2호점 재고량)
		int oneStore = filmService.getFilmCount(FID, 1);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ oneStore : "+oneStore);
		int twoStore = filmService.getFilmCount(FID, 2);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ twoStore : "+twoStore);
		
		model.addAttribute("filmOne", flimOne);
		model.addAttribute("oneStore", oneStore);
		model.addAttribute("twoStore", twoStore);
		
		return "getFilmOne";
	}
	
	// 영화리스트+검색,페이징
	@GetMapping("getFilmList")
	public String getFilmList(Model model,
								@RequestParam(value="categoryVal", required = false) String categoryVal,
								@RequestParam(value="priceVal", required = false) String priceVal,
								@RequestParam(value="ratingVal", required = false) String ratingVal,
								@RequestParam(value="titleVal", required = false) String titleVal,
								@RequestParam(value="actorsVal", required = false) String actorsVal,
								@RequestParam(value="currentPage", defaultValue = "1") int currentPage,
								@RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ categoryVal : "+categoryVal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ priceVal : "+priceVal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ ratingVal : "+ratingVal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ titleVal : "+titleVal);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ actorsVal : "+actorsVal);
		
		// 선택하지 않았을경우 버그수정
		if(categoryVal != null && categoryVal.equals("")) {
			categoryVal = null;
		}
		// 선택하지 않았을경우 버그수정
		if(priceVal != null && priceVal.equals("")) {
			priceVal = null;
		}
		// 선택하지 않았을경우 버그수정
		if(ratingVal != null && ratingVal.equals("")) {
			ratingVal = null;
		}
		// 선택하지 않았을경우 버그수정
		if(titleVal != null && titleVal.equals("")) {
			titleVal = null;
		}
		
		Map<String, Object> map = filmService.getFilmList(categoryVal, priceVal, ratingVal, titleVal, actorsVal, currentPage, rowPerPage);
		// List
		model.addAttribute("filmList", map.get("filmList"));
		model.addAttribute("categoryNameList", map.get("categoryNameList"));
		model.addAttribute("priceList", map.get("priceList"));
		model.addAttribute("ratingList", map.get("ratingList"));
		// Page
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", map.get("lastPage"));
		// Value
		model.addAttribute("categoryVal", categoryVal);
		model.addAttribute("priceVal", priceVal);
		model.addAttribute("ratingVal", ratingVal);
		model.addAttribute("titleVal", titleVal);

		return "getFilmList";
	}
}
