package com.kh.billida.rentalHistory.model.service;

import java.time.LocalDate;
import java.util.List;

import com.kh.billida.rentalHistory.model.dto.LockerForLental;
import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.dto.ReviewForRentHistory;

public interface RentalService {

	LockerForLental selectLocker(Long lockerId);
	
	void insertRental(Rental rental);

	List<ReviewForRentHistory> selectReview(Long lockerId);

	void updateRental(Long lockerId);

	void downGradeMember(String userCode);

	void returnBatch(LocalDate today);

}
