package com.kh.billida.rentalHistory.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.service.RentalService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("rental")
public class RentalController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	private final RentalService rentalService;
	
	
	@GetMapping("rental-form")
	public void rentalForm(Rental rental, HttpSession session){
		
		rentalService.insertBilligi(rental);
		
	}
	

}
