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
	
	private final RentalRepository rentalRepository;
	
	@GetMapping("rental-form")
	public void rental(){
	}
	
	@PostMapping("rental-form")
	public String rentalForm(Rental rental){
		
		// rentalService.insertRental(rental);
		// 아니 애는 왜 null point
		
		rentalRepository.insertRental(rental);
		// 맵핑하고 맵퍼에서 처리하는거랑 리포지토리에서 처리하는거랑 무슨 차이였지
		
		return "redirect:/rental/rental-form";
	}
	

	

}
