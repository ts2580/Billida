package com.kh.billida.rentalHistory.model.service;

import org.springframework.stereotype.Service;
import com.kh.billida.rentalHistory.model.dto.LockerForLent;
import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.repository.RentalRepository;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class RentalServiceImpl implements RentalService{
	
	private final RentalRepository rentalRepository;
	
	public LockerForLent selectLocker(int lockerId) {
		System.out.println("selectLocker 서비스 까지 옴");
		LockerForLent locker = rentalRepository.selectLocker(lockerId);
		
		return locker;
	}
	
	public void insertRental(Rental rental) {
		System.out.println("insertRental 서비스 까지 옴");
		rentalRepository.insertRental(rental);
	}
	
	
	
	
	
	
	
}
