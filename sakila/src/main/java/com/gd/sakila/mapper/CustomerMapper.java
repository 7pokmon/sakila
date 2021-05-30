package com.gd.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerMapper {
	List<Map<String, Object>> selectCustomerList(Map<String, Object> map);
	Map<String, Object> selectCustomerOneById(int customerId);
	List<Map<String, Object>> selectRentalListByCustomer(int customerId);
	
	int updateCustomerActiveByScheduler();
	int selectCustomerTotal(Map<String, Object> map);
}
