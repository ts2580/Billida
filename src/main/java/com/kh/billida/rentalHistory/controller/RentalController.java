package com.kh.billida.rentalHistory.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.repository.RentalRepository;
import com.kh.billida.rentalHistory.model.service.RentalService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("rental")
public class RentalController {
	
	private RentalService rentalService;
	// 이친구는 왜 final 붙이면 빈에 바인딩이 안되냐
	private final RentalRepository rentalRepository;
	
	@GetMapping("rental-form")
	public void rental(){
	}
	
	@PostMapping("rental-form")
	public String rentalForm(Rental rental){
		// rentalService.insertRental(rental);
		// 아니 애는 왜 null point
		rentalRepository.insertRental(rental);
		return "redirect:/rental/rental-form";
	}
	

	

}
