package com.sportify.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sportify.dao.AdminDao;
import com.sportify.model.dto.AdminDto;
import com.sportify.model.po.Admin;

@Service
public class AdminService {

	@Autowired
	AdminDao adminDao;
	
	public Optional<AdminDto> findByEmail(String adminEmail) {
		return adminDao.findByEmail(adminEmail);
	}
	
	public AdminDto loginAdmin(String adminEmail, String adminPassword) {
		Optional<AdminDto> admin = findByEmail(adminEmail);
		if(admin.isPresent() && admin.get().getAdminPassword().equals(adminPassword)) {
			return admin.get();
		}
		return null;
	}

}
