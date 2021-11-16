package com.kh.billida.rentalHistory.model.service;

import com.kh.billida.rentalHistory.model.dto.LockerForLent;
import com.kh.billida.rentalHistory.model.dto.Rental;

public interface RentalService {

	void insertRental(Rental rental);
 
	LockerForLent selectLocker(int param);

}
