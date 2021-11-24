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
import com.kh.billida.rentalHistory.model.dto.ReviewForRentHistory;
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
	
		// 이하 자바
		
		// **** rentHistory에 들어가는 userCode값은 locker에서 이제는 auth?에서 가져올것
		
		// view단의 userCode는 Member 테이블과 조인해서 뭐야 뭐가이렇게많아 ID나 NAME나 NICK으로 넣을것
		
		// 리뷰 수가 5개 이하더라도 undefined안나게 처리
		
		
		
		
		// 이하 자바스크립트
		
		// 점수에 따라 아이콘 바뀌게
		
		// <i class="far fa-smile-beam"></i> 
		// <i class="far fa-smile-wink"></i>
		// <i class="far fa-meh"></i>
		// <i class="fas fa-frown-open"></i>
				
		// 현재날자 이전엔 못빌리게
		
		// 기한이 현재날자 이전으로 가지 않게
		
		// 스코어 숫자로된거 별표로 변환, 유니코드 알아보고 쓰기
		
		List<ReviewForRentHistory> reviews = new ArrayList<ReviewForRentHistory>();
		reviews = rentalService.selectReview(lockerId);
		
		model.addAttribute("reviews", reviews);
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
