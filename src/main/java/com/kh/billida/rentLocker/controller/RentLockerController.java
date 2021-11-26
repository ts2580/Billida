package com.kh.billida.rentLocker.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.billida.member.model.dto.Member;
import com.kh.billida.rentLocker.model.dto.Locker;
import com.kh.billida.rentLocker.model.service.RentLockerService;

import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("rentLocker")
public class RentLockerController {

	private final RentLockerService rentLockerService;
	
	@GetMapping("rent-form")
	public void rental(Model model){
		// Qwerasdf1234!
		
		// 하드코딩으로 DB 연결(완료)
		
		// 락커 타이틀은 락커 컨텐츠값(도로명주소) 적절히 잘라서(완료). 
		
		// 지번이랑 위도경도는 필요한가?
		
		// 비밀번호엔 숫자만 들어가고 길이제한 주자
		
		// 도로명 주소 입력하면 지번 자동 입력되게
		
	}
	
	@PostMapping("rent-form")
	public String rentalForm(HttpSession session, Member member, Locker locker){
		
		// member = (Member)session.getAttribute("authentication");
		
		// locker.setUserCode(member.getUserCode());
		
		locker.setUserCode("108");
		
		rentLockerService.insertLocker(locker);
		return "redirect:/rentLocker/rent-form";
	}
	
	
}