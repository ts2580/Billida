package com.kh.billida.rentalHistory.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.billida.rentalHistory.model.dto.LockerForLental;
import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.dto.ReviewForRentHistory;
import com.kh.billida.rentalHistory.model.repository.RentalRepository;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class RentalServiceImpl implements RentalService{
	
	private final RentalRepository rentalRepository;
	
	public LockerForLental selectLocker(Long lockerId) {
		LockerForLental locker = rentalRepository.selectLocker(lockerId);
		return locker;
	}
	
	public void insertRental(Rental rental) {
		rentalRepository.insertRental(rental);
	}

	public List<ReviewForRentHistory> selectReview(Long lockerId) {
		List<ReviewForRentHistory> reviews = rentalRepository.selectReview(lockerId);
		return reviews;
	}

	public void updateRental(Long lockerId) {
		rentalRepository.updateRental(lockerId);
	}

	public void downGradeMember(String userCode) {
		rentalRepository.downGradeMember(userCode);
		
	}	
	
}
