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

import java.time.LocalDate;

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
		
		// 지번이랑 위도경도는 필요한가? 몰라 걍 넣어(처리) 
		
		// 도로명 주소 입력하면 지번 자동 입력되게(처리)
		
		// 도로명 주소 입력하면 좌표 자동 입력되게(처리)
		
		// 로그인 유무에 따른 권한(처리)
		
		// form 위치는 fix시키자(처리)
		
		// 이미지 바이너리로 받아서 텍스트 클롭으로 변환하고 비트어레이로 보내(약간 다르긴 하지만 처리)
		
		// 사진 교체시 하단에 div 하나 더 파지말고 원래 있던거 교체하도록(처리)
		
		// 각 폼 입력 필터 && 빈칸 유무에 따른 제약 추가(처리)
		
		// view단에 있는 스크립트들 다 js파일로 보내기(처리)
		
		// 임시로 때운 auth 관련 제한 제대로 구현하기(인터셉터 태워)
		
		// css 필요없는 input값은 id나 class 날려버리기(처리)
		
		// 내가 등록한 사물함 / 내가 빌린 사물함, 리뷰 클릭시 팝업창 / 내가 작성한 리뷰, 수정 팝업창. 이미지 clob 로딩 작업
		
		LocalDate today = LocalDate.now();
		
		model.addAttribute("today", today);
		
		
	}
	
	@PostMapping("rent-form")
	public String rentalForm(HttpSession session, Member member, Locker locker){
		
		member = (Member)session.getAttribute("authentication");
		locker.setUserCode(member.getUserCode());
		rentLockerService.insertLocker(locker);
		
		Long insertedLockerId = rentLockerService.selectInsertedLocker();
		locker.setImgToClob(locker.getImgToClob());
		locker.setLockerId(insertedLockerId);
		
		rentLockerService.insertClob(locker);
		return "redirect:/rentLocker/rent-form";
	}	
	
}