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
	
	private int lockerId;
	
	private int userCode;
	
	@GetMapping("rental-form")
	public void rental(Model model, LockerForLent locker){
		// Qwerasdf1234!
		
		lockerId = 35;
		locker.setLockerId(lockerId);
		// 메인페이지에서 lockerId 타고 들어옴. 임시로 숫자 집어넣음
		// 파라미터로 받을지 세션으로 받을지 상의 후 정할것
		
		System.out.println(locker);
		
		// locker = rentalService.selectLocker(lockerId);
		// 애는 또 왜 nullpoint가 뜨냐고
		
		locker = rentalRepository.selectLocker(lockerId);
		userCode = locker.getUserCode();
		
		model.addAttribute("locker", locker);

	}
	
	@PostMapping("rental-form")
	public String rentalForm(Rental rental, Model model){
		
		// rentalService.insertRental(rental);
		// 아니 애는 왜 null point
		
		rental.setLockerId(lockerId);
		rental.setUserCode(Integer.toString(userCode));
		
		rentalRepository.insertRental(rental);
		// 맵핑하고 맵퍼에서 처리하는거랑 리포지토리에서 처리하는거랑 무슨 차이였지
		
		return "redirect:/rental/rental-form";
	}
	

	

}
