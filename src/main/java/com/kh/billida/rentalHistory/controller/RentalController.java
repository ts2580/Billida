package com.kh.billida.rentalHistory.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.billida.main.model.dto.Main;
import com.kh.billida.main.model.service.MainService;
import com.kh.billida.member.model.dto.Member;
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
		
		// 이하 자바
		
		// **** rentHistory에 들어가는 userCode값은 locker에서 이제는 auth?에서 가져올것 (처리)
		
		// view단의 userCode는 Member 테이블과 조인해서 뭐야 뭐가이렇게많아 ID나 NAME나 NICK으로 넣을것 (처리)
		
		
		// 프로시저 하나 파서 빌리기하면 렌트히스토리 테이블이랑 카카오 테이블, 멤버테이블 세군데 다 DB 올라가도록
		// 		아님 귀찮으면 카카오 테이블, 멤버테이블 sql구문 하나씩 더 만들어서 처리할까
		
		////////////////////////////////////////////////////////////////////////////////////////////////
		
		// 이하 자바스크립트
		
		// 스코어 숫자로된거 별표로 변환, 유니코드 알아보고 쓰기(처리)
		
		// 리뷰 수가 5개 이하더라도 undefined안나게 처리(처리)
		
		// 비용 자동계산해서 화면에 띄우기(처리)
		
		// 현재날자 이전엔 못빌리게(처리)
		
		// 점수에 따라 아이콘 바뀌게
		// 		<i class="far fa-smile-beam"></i> 
		// 		<i class="far fa-smile-wink"></i>
		// 		<i class="far fa-meh"></i>
		// 		<i class="fas fa-frown-open"></i>
		
		
		
		// 로그인 안했을시 로그인 하라고 경고창 띄우기
		
		this.lockerId = lockerId;
		locker.setLockerId(lockerId);
		locker = rentalService.selectLocker(lockerId);
		
		List<ReviewForRentHistory> reviews = new ArrayList<ReviewForRentHistory>();
		reviews = rentalService.selectReview(lockerId);
		
		LocalDate today = LocalDate.now();
		
		if(today.getDayOfYear() < locker.getRentableDateStart().toLocalDate().getDayOfYear()) {
			today = locker.getRentableDateStart().toLocalDate();
		};
		
		
		model.addAttribute("today", today);
		model.addAttribute("reviews", reviews);
		model.addAttribute("locker", locker);
		
	}
	
	@PostMapping("rental-form")
	public String rentalForm(Rental rental, HttpSession session, Member member){
		
		member = (Member)session.getAttribute("authentication");
		
		String userCode = member.getUserCode();
		
		LocalDate rentStart = rental.getRentStart().toLocalDate();
		LocalDate rentEnd = rental.getRentEnd().toLocalDate();
		
		int rentdate = rentEnd.getDayOfYear()-rentStart.getDayOfYear()+1;
		
		if(rentEnd.getYear() != rentStart.getYear()) {
			rentdate = 365-rentStart.getDayOfYear()+rentEnd.getDayOfYear()+1;
		};
		
		
		
		int rentCost = rentdate*3000;
		
		rental.setLockerId(lockerId);
		rental.setUserCode(userCode);
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
