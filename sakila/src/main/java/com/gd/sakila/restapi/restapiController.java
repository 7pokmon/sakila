package com.gd.sakila.restapi;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.mapper.InventoryMapper;
import com.gd.sakila.mapper.PaymentMapper;
import com.gd.sakila.service.CategoryService;
import com.gd.sakila.service.CityService;
import com.gd.sakila.service.CountryService;
import com.gd.sakila.service.RentalService;
import com.gd.sakila.vo.City;
import com.gd.sakila.vo.Country;

@RestController
public class restapiController {
	@Autowired CountryService countryService;
	@Autowired CityService cityService;
	@Autowired InventoryMapper inventoryMapper;
	@Autowired CategoryService categoryService;
	@Autowired RentalService rentalService;
	@Autowired PaymentMapper paymentMapper;
	
	@GetMapping("/payment")
	public List<Map<String, Object>> payment(@RequestParam(value="year", defaultValue = "2005") int year){
		return paymentMapper.selectSumPayment(year);
	}
	
	@GetMapping("/rental")
	public List<Map<String, Object>> rental(@RequestParam(value = "year", defaultValue = "2005") int year){
		return rentalService.getRentalMonthCnt(year);
	}
	
	@GetMapping("/category")
	public List<Map<String, Object>> category() {
		return categoryService.getCategorySales();
	}
	
	@GetMapping("/amount")
	public List<Map<String, Object>> amount(@RequestParam(value = "inventoryId", required = true) int inventoryId){
		return inventoryMapper.selectAmountByInventoryId(inventoryId);
	}
	
	@GetMapping("/country")
	public List<Country> country() {
		return countryService.getCountryList();
	}
	
	@GetMapping("/city")
	public List<City> city(@RequestParam(value = "countryId") int countryId) {
		return cityService.getCityListById(countryId);
	}
}
