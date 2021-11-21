package com.kh.billida.rentalHistory.model.service;

import com.kh.billida.rentalHistory.model.dto.LockerForLent;
import com.kh.billida.rentalHistory.model.dto.Rental;

public interface RentalService {

	LockerForLent selectLocker(Long lockerId);
	
	void insertRental(Rental rental);
 

}
