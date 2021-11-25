package com.kh.billida.locker.model.service;

import org.springframework.stereotype.Service;


import com.kh.billida.locker.model.dto.Locker;
import com.kh.billida.locker.model.repository.LockerRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LockerServiceImpl implements LockerService{
	
	private final LockerRepository lockerRepository;
	
	
	@Override
	public Locker selectUserCode(Long user_code) {
		Locker locker = lockerRepository.selectUserCode(user_code);
		return locker;
	}

	@Override
	public void insertLocker(Locker locker) {
		lockerRepository.insertLocker(locker);
		
	}

	
	
	
}