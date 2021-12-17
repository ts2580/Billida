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

	int downGradeMember(String userCode);

	int returnBatch(LocalDate today);
	
	int insertAndUpdateRental(Rental rental);
	
	int selectAndUpdateRentalMileage(Mileage RantalMileage);

	int selectAndUpdateLessorMileage(LessorMileage lessorMileage);
	
}
