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
	
	public LockerForLent selectLocker(Long lockerId) {
		LockerForLent locker = rentalRepository.selectLocker(lockerId);
		return locker;
	}
	
	public void insertRental(Rental rental) {
		rentalRepository.insertRental(rental);
	}
	
	
	
	
	
	
	
}
