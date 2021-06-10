package com.gd.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.CategoryMapper;
import com.gd.sakila.vo.Category;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	
	// categoryList Service
	public List<Category> getCategoryList() {
		return categoryMapper.selectCategoryNameList();
	}
	
	// categorySalseList Service
	public List<Map<String, Object>> getCategorySales() {
		return categoryMapper.selectCategorySales();
	}
}
