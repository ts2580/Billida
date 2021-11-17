package com.kh.billida.rentalHistory.controller;


import org.springframework.context.annotation.Lazy;
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
	
	private final RentalService rentalService;
	
	private int lockerId;
	
	
	@GetMapping("rental-form")
	public void rental(Model model, LockerForLent locker){
		// Qwerasdf1234!
		
		lockerId = 35;
		locker.setLockerId(lockerId);
		System.out.println("locker : "+locker);
		// 메인페이지에서 lockerId 타고 들어옴. 임시로 숫자 집어넣음
		// 파라미터로 받을지 세션으로 받을지 상의 후 정할것
		
		locker = rentalService.selectLocker(lockerId);
	
		model.addAttribute("locker", locker);

	}
	
	@PostMapping("rental-form")
	public String rentalForm(Rental rental, Model model){
		
		rental.setLockerId(lockerId);
		rental.setUserCode(rentalService.selectLocker(lockerId).getUserCode());
		
		rentalService.insertRental(rental);
		// 맵핑하고 맵퍼에서 처리하는거랑 리포지토리에서 처리하는거랑 무슨 차이였지
		// 긴거 맵퍼, 짧은거 리포지토리
		
		return "redirect:/rental/rental-form";
	}

	
	

	

}
