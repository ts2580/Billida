package com.kh.billida.rentalHistory.model.service;

import java.util.List;

import com.kh.billida.rentalHistory.model.dto.LockerForLent;
import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.dto.ReviewForRentHistory;

public interface RentalService {

	LockerForLent selectLocker(Long lockerId);
	
	void insertRental(Rental rental);

	List<ReviewForRentHistory> selectReview(Long lockerId);

	void updateRental(Long lockerId);

	void downGradeMember(String userCode);

}
