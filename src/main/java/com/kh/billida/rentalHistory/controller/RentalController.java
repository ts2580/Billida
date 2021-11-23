package com.kh.billida.rentalHistory.controller;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.billida.main.model.dto.Main;
import com.kh.billida.main.model.service.MainService;
import com.kh.billida.rentalHistory.model.dto.LockerForLent;
import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.service.RentalService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("rental")
public class RentalController {
	
	private final RentalService rentalService;
	
	private final MainService mainService;
	
	private Long lockerId;
	
	@GetMapping("rental-form")
	public void rental(Model model, LockerForLent locker, Long lockerId){
		// Qwerasdf1234!
		
		this.lockerId = lockerId;
		locker.setLockerId(lockerId);
		// 파라미터로 받음. 개꿀
		locker = rentalService.selectLocker(lockerId);
	
		
		
		
		// <i class="far fa-smile-beam"></i> 
		// <i class="far fa-smile-wink"></i>
		// <i class="far fa-meh"></i>
		// <i class="fas fa-frown-open"></i>
		
		
		
		
		
		
		
		
		
		
		
		
		model.addAttribute("locker", locker);
		
	}
	
	@PostMapping("rental-form")
	public String rentalForm(Rental rental){
		
		LocalDate rentStart = rental.getRentStart().toLocalDate();
		LocalDate rentEnd = rental.getRentEnd().toLocalDate();
		
		int rentCost = (rentEnd.getDayOfYear()-rentStart.getDayOfYear()+1)*3000;
		
		rental.setLockerId(lockerId);
		rental.setUserCode(rentalService.selectLocker(lockerId).getUserCode());
		rental.setRentCost(rentCost);
		
		rentalService.insertRental(rental);
		// 맵핑하고 맵퍼에서 처리하는거랑 리포지토리에서 처리하는거랑 무슨 차이였지
		// 긴거 맵퍼, 짧은거 리포지토리
		
		return "redirect:/rental/rental-form?lockerId="+lockerId;
	}

	@GetMapping("indexLinkTest")
	public void indexLinkTest(Model model) {
		List<Main> mainList = new ArrayList<Main>();
		mainList = mainService.selectLockerList(); 

		Map<String, Object> commandMap = new HashMap<String, Object>();
		commandMap.put("mainList", mainList);
		
		model.addAllAttributes(commandMap);
	}
	

	

}
