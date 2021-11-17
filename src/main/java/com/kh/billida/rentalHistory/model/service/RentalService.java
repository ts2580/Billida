package com.kh.billida.rentalHistory.model.service;

import com.kh.billida.rentalHistory.model.dto.LockerForLent;
import com.kh.billida.rentalHistory.model.dto.Rental;

public interface RentalService {

	LockerForLent selectLocker(int lockerId);
	
	void insertRental(Rental rental);
 

}
