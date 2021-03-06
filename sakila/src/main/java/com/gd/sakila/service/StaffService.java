package com.gd.sakila.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.sakila.mapper.AddressMapper;
import com.gd.sakila.mapper.StaffMapper;
import com.gd.sakila.vo.Address;
import com.gd.sakila.vo.Page;
import com.gd.sakila.vo.Staff;
import com.gd.sakila.vo.StaffForm;
import com.gd.sakila.vo.StaffList;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class StaffService {
	@Autowired StaffMapper staffMapper; // DI, @AutoWired 없으면 --> NullPointException 발생
	@Autowired AddressMapper addressMapper;
	
	// addStaff + address 트랜잭션 Service
	public void addStaff(StaffForm staffForm) {
		
		// Insert address
		Address address = staffForm.getAddress();
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ addStaff() address : "+address);
		addressMapper.insertAdress(address);
		
		// 생성된 Id가져오기
		int addressId = staffForm.getAddress().getAddressId();
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ addStaff() addressId : "+addressId);
		
		// 가져온 Id 주입후 Insert실행
		Staff staff = staffForm.getStaff();
		staff.setAddressId(addressId);
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ addStaff() staff : "+staff);
		
		staffMapper.insertStaff(staff);
		
	}
	
	// login Service
	public Staff login(Staff staff) {
		log.debug(""+staff);
		return staffMapper.selectStaffByLogin(staff); // null or staff객체
	}
	
	// staffList Service
	public List<StaffList> getStaffList(int storeId) {
		log.debug("▶▶▶▶▶▶▶▶▶▶▶ getStaffList() storeId : "+storeId);
		
		return staffMapper.selectStaffList(storeId);
	}
	
}
