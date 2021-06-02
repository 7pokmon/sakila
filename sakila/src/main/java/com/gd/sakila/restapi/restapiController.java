package com.gd.sakila.restapi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.sakila.service.CityService;
import com.gd.sakila.service.CountryService;
import com.gd.sakila.vo.City;
import com.gd.sakila.vo.Country;

@RestController
public class restapiController {
	@Autowired CountryService countryService;
	@Autowired CityService cityService;
	
	@GetMapping("/country")
	public List<Country> country() {
		return countryService.getCountryList();
	}
	
	@GetMapping("/city")
	public List<City> city(@RequestParam(value = "countryId") int countryId) {
		return cityService.getCityListById(countryId);
	}
}
