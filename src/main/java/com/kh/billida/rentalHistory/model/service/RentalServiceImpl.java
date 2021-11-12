package com.kh.billida.rentalHistory.model.service;

import org.springframework.stereotype.Service;

import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.repository.RentalRepository;


import lombok.Data;


@Data
@Service
public class RentalServiceImpl {
	
	private final RentalRepository rentalRepository;
	
	public void insertBilligi(Rental rental) {
		System.out.println("서비스 까지 옴");
		rentalRepository.insertRental(rental);
	}
	
}
