package com.kh.billida.mileage.model.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.billida.mileage.model.dto.Mileage;
import com.kh.billida.mileage.model.repository.MileageRepository;
import com.kh.billida.review.model.repository.ReviewRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MileageServiceImpl implements MileageService{
	
	private final MileageRepository mileageRepository;

	@Override
	public void updateMileage(Map<String, Object> commandMap) {
		mileageRepository.updateMileage(commandMap);
		
	}

	@Override
	public Mileage selectUserMileage(String userCode) {
		return mileageRepository.selectUserMileage(userCode);
	}

	@Override
	public void insertMileage(Map<String, Object> commandMap) {
		mileageRepository.insertMileage(commandMap);
	}

}
