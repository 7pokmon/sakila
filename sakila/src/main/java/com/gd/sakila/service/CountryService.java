package com.gd.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CountryMapper;
import com.gd.sakila.vo.Country;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CountryService {
	@Autowired CountryMapper countryMapper;
	
	// countryList Service
	public List<Country> getCountryList() {
		return countryMapper.selectCountryList();
	}
}
