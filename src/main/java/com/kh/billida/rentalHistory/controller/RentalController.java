package com.kh.billida.rentalHistory.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.billida.member.model.dto.Member;
import com.kh.billida.rentalHistory.model.dto.LockerForLental;
import com.kh.billida.rentalHistory.model.dto.Rental;
import com.kh.billida.rentalHistory.model.dto.ReviewForRentHistory;
import com.kh.billida.rentalHistory.model.service.RentalService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("rentalLocker")
public class RentalController {
	
	private final RentalService rentalService;
	
	private Long lockerId;
	
	private Long isRented;
	
	@GetMapping("rental-form")
	public void rental(Model model, LockerForLental locker, Long lockerId){
		// Qwerasdf1234!
		
		// 이하 자바
		
		// **** rentHistory에 들어가는 userCode값은 locker에서 이제는 auth?에서 가져올것 (처리)
		
		// 필드에 lockerId 처리하기?
		
		// 프로시저 하나 파서 빌리기하면 렌트히스토리 테이블(완료)과 락커(현재상태) 카카오 테이블(마일리지 차감), 멤버테이블(마일리지 차감) 네군데 다 DB 올라가도록
		// 		아님 귀찮으면 카카오 테이블, 멤버테이블 sql구문 하나씩 더 만들어서 처리할까
		//      일단 locker의 RENT_STATUS값 Boolean으로 바꾸면 어떤지. 
		//		카카오 테이블의 마일리지는 멤버테이블의 마일리지값을 외래키로 가져오게 하도록 테이블 수정하면 안되는지. 테이블 두개 수정하기 귀찮음
		//		락커테이블 PROFIT이나 RENTED_CNT, 멤버의 마일리지 기능 등은 결제기능 붙으면 그때 작업 시작할것
		
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		// 이하 자바스크립트
		
		// review 테이블에 userCode 밖에 없는거 Member 테이블과 조인해서 id나 name, 훅은 nick 가져오기 (처리)
		
		// 스코어 숫자로된거 별표로 변환, 유니코드 알아보고 쓰기(처리)
		
		// 리뷰 수가 5개 이하더라도 undefined안나게 처리(처리)
		
		// 비용 자동계산해서 화면에 띄우기(처리)
		
		// 현재날자 이전엔 못빌리게(처리)
		
		// 연도 넘어가면 비용 마이너스 찍히는것(처리)
		
		// 점수에 따라 아이콘 바뀌게(처리)
		
		// review deleteYn이 N 일때만 가져오기(처리)
		
		// 로그인 안했을시 && 날자 안골랐을시 경고창 띄운다음 stop(처리)
		
		// 빌리기 성공하면 락커테이블 스테이터스 바꾸고, 빌리기 버튼을 대여중 div로 변경(처리)
		
		// locker 정보에 상태가 빌리는중이면 빌리기버튼을 대여중으로 바꿀것(처리)
		
		// 개발자도구에서 노드 수정시 값 제출되는것 수정(처리) 
		
		// 매일 자정 배치 돌려서 대여기간 끝나면 락커 테이블 렌트 스테이터스 바꾸기
		
		// 멤버에서 결제관련 처리 끝나면 마일리지 받아오고, 부족시 예외사항 처리
		
		// 위치 버튼 누르면 카카오맵으로 위치 띄워주기
		
		// 리뷰에 페이징 적용(아 이건 못할듯)
		
		// 헤더로 접근하는 빌리기 페이지 만들기. 지역별 정렬(이것도 못할듯)
		
		this.lockerId = lockerId;
		locker.setLockerId(lockerId);
		locker = rentalService.selectLocker(lockerId);
		isRented = locker.getRentStatus();
		
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
		
		if(isRented == 1) {
			rentalService.downGradeMember(userCode);
			return "redirect:/";
		}
		
		
		rentalService.insertRental(rental);
		rentalService.updateRental(lockerId);
		// 맵핑하고 맵퍼에서 처리하는거랑 리포지토리에서 처리하는거랑 무슨 차이였지
		// 긴거 맵퍼, 짧은거 리포지토리
		
		return "redirect:/rentalLocker/rental-form?lockerId="+lockerId;
	}

}
