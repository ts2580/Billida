package com.kh.billida.rentalHistory.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.billida.rentalHistory.model.dto.LockerForLent;
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
	public void rental(Model model){
		// Qwerasdf1234!
		
		LockerForLent locker = new LockerForLent();
		
		int param = 33;
		locker.setLockerId(param);
		// 메인페이지에서 넘어온 라커 ID 파라미터가 33이라고 가정
		
		// locker = rentalService.selectLocker(param);
		// 애는 또 왜 nullpoint가 뜨냐고
		
		locker = rentalRepository.selectLocker(param);
		model.addAttribute("locker", locker);
		System.out.println(model);
	}
	
	@PostMapping("rental-form")
	public String rentalForm(Rental rental, Model model){
		
		// rentalService.insertRental(rental);
		// 아니 애는 왜 null point
		
		
		rentalRepository.insertRental(rental);
		// 맵핑하고 맵퍼에서 처리하는거랑 리포지토리에서 처리하는거랑 무슨 차이였지
		
		return "redirect:/rental/rental-form";
	}
	

	

}
