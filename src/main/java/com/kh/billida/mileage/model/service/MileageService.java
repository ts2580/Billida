package com.kh.billida.mileage.model.service;

import java.util.Map;

import com.kh.billida.mileage.model.dto.Mileage;

public interface MileageService {

	void updateMileage(Map<String, Object> commandMap);

	Mileage selectUserMileage(String userCode);

	void insertMileage(Map<String, Object> commandMap);

}
