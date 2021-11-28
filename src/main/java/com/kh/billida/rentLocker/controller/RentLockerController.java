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
		
		// 지번이랑 위도경도는 필요한가? 몰라 걍 넣어(처리) 
		
		// 도로명 주소 입력하면 지번 자동 입력되게(처리)
		
		// 도로명 주소 입력하면 좌표 자동 입력되게(처리)
		
		// 로그인 유무에 따른 권한(처리)
		
		// 이미지 바이너리로 받아서 텍스트 클롭으로 변환하고 비트어레이로 보내(약간 다르긴 하지만 처리)
		
		// 사진 교체시 하단에 div 하나 더 파지말고 원래 있던거 교체하도록
		
		// 임의로 auth값 넣었을때 진행됨. 이떄 어떻게 처리하지. 자바단에서 잡아야하는데. userCode 안넘어왔는데 진행시 강등시켜 post에서 처리
		
		// 각 폼 입력 필터 && 빈칸 유무에 따른 제약 추가
		
		// 상세주소 꼭 입력하도록 해
		
		
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