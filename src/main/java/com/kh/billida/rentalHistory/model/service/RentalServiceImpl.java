package com.kh.billida.rentalHistory.model.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.billida.rentalHistory.model.dto.LessorMileage;
import com.kh.billida.rentalHistory.model.dto.LockerForLental;
import com.kh.billida.rentalHistory.model.dto.Mileage;
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
	
	public void insertAndUpdateRental(Rental rental) {
		rentalRepository.insertAndUpdateRental(rental);
	}

	public List<ReviewForRentHistory> selectReview(Long lockerId) {
		List<ReviewForRentHistory> reviews = rentalRepository.selectReview(lockerId);
		return reviews;
	}
	
	public Long selectRentalMileage(Mileage rantalMileage) {
		return rentalRepository.selectRentalMileage(rantalMileage);
	}

	public void downGradeMember(String userCode) {
		rentalRepository.downGradeMember(userCode);
		
	}

	public void returnBatch(LocalDate today) {
		rentalRepository.returnBatch(today);
		
	}
	
	public void selectAndUpdateRentalMileage(Mileage RantalMileage) {
		rentalRepository.selectAndUpdateRentalMileage(RantalMileage);
	}

	public void selectAndUpdateLessorMileage(LessorMileage lessorMileage) {
		rentalRepository.selectAndUpdateLessorMileage(lessorMileage);
		
	}

	
}
