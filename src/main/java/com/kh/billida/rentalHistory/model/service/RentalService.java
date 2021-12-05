package com.kh.billida.rentalHistory.model.service;

import java.time.LocalDate;
import java.util.List;

import com.kh.billida.rentalHistory.model.dto.LessorMileage;
import com.kh.billida.rentalHistory.model.dto.LockerForLental;
import com.kh.billida.rentalHistory.model.dto.Mileage;
import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.dto.ReviewForRentHistory;

public interface RentalService {

	LockerForLental selectLocker(Long lockerId);
	
	List<ReviewForRentHistory> selectReview(Long lockerId);
	
	Long selectRentalMileage(Mileage rantalMileage);

	void downGradeMember(String userCode);

	void returnBatch(LocalDate today);
	
	void selectAndUpdateRentalMileage(Mileage RantalMileage);
	
	void insertAndUpdateRental(Rental rental);

	void selectAndUpdateLessorMileage(LessorMileage lessorMileage);
	
}
