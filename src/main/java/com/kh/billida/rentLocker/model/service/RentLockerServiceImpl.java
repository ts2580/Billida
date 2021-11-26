package com.kh.billida.rentLocker.model.service;

import org.springframework.stereotype.Service;

import com.kh.billida.rentLocker.model.dto.Locker;
import com.kh.billida.rentLocker.model.repository.RentLockerRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RentLockerServiceImpl implements RentLockerService{
	
	private final RentLockerRepository rentLockerRepository;

	public void insertLocker(Locker locker) {
		rentLockerRepository.insertLocker(locker);
	}
	

	
	
	
}