package com.sportify.dao;


import java.util.Optional;

import com.sportify.model.dto.AdminDto;
import com.sportify.model.po.Admin;

public interface AdminDao {
	


	Optional<AdminDto> findByEmail(String adminEmail);
}
