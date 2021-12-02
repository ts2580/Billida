package com.kh.billida.rentLocker.model.service;

import java.time.LocalDate;

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
	
	public Long selectInsertedLocker() {
		
		return rentLockerRepository.selectInsertedLocker();
	}
	
	public void insertClob(Locker locker) {
		rentLockerRepository.insertClob(locker);
	}

	@Override
	public void returnBatch(LocalDate today) {
		rentLockerRepository.returnBatch(today);
		
	}

	
	

	
	
	
}