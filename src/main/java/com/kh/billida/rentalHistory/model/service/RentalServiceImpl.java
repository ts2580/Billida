package com.kh.billida.rentalHistory.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.billida.rentalHistory.model.dto.LockerForLent;
import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.dto.ReviewForRentHistory;
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

	public List<ReviewForRentHistory> selectReview(Long lockerId) {
		List<ReviewForRentHistory> reviews = rentalRepository.selectReview(lockerId);
		return reviews;
	}	
	
}
