package com.kh.billida.rentalHistory.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.billida.member.model.dto.Member;
import com.kh.billida.rentalHistory.model.dto.LessorMileage;
import com.kh.billida.rentalHistory.model.dto.LockerForLental;
import com.kh.billida.rentalHistory.model.dto.Mileage;
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
	
	private float latitude;
	
	private float longitude;
	
	@GetMapping("rental-form")
	public void rental(Model model, LockerForLental locker, Long lockerId, Member member, HttpSession session){
		
		member = (Member)session.getAttribute("authentication");
		
		String userCode = member.getUserCode();
		
		this.lockerId = lockerId;
		locker.setLockerId(lockerId);
		
		locker = rentalService.selectLocker(lockerId);
		
		if(locker == null) {
			model.addAttribute("DataBaseAccessError", "DB접속 에러");
		}else{
			latitude = locker.getLatitude();
			longitude = locker.getLongitude();
			isRented = locker.getRentStatus();
			
			LocalDate today = LocalDate.now();
			
			if(today.getDayOfYear() < locker.getRentableDateStart().toLocalDate().getDayOfYear()) {
				today = locker.getRentableDateStart().toLocalDate();
			};
			
			model.addAttribute("today", today);
		}
		
		List<ReviewForRentHistory> reviews = new ArrayList<ReviewForRentHistory>();
		reviews = rentalService.selectReview(lockerId);
		
		if(reviews == null) {
			model.addAttribute("DataBaseAccessError", "DB접속 에러");
		}
		
		Mileage RantalMileage = new Mileage();
		RantalMileage.setUserCode(userCode);
		
		Long RantalMileageCost = rentalService.selectRentalMileage(RantalMileage);
		
		if(RantalMileageCost != null) {
			model.addAttribute("RantalMileage", RantalMileageCost);
		}else{
			model.addAttribute("RantalMileage", "error");
		};
		
		model.addAttribute("reviews", reviews);
		model.addAttribute("locker", locker);
		
	}
	
	@Scheduled(cron = "55 59 23 * * *")
	public void returnBatch() {
		
		LocalDate today = LocalDate.now();
		rentalService.returnBatch(today);
		
	};
	
	@GetMapping("map")
	public void map(Model model){
		
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
	}
	
	@Transactional
	@PostMapping("rental-form")
	public String rentalForm(Rental rental, HttpSession session, Member member, RedirectAttributes redirect){
		
		member = (Member)session.getAttribute("authentication");
		
		String userCode = member.getUserCode();
		
		LocalDate rentStart = rental.getRentStart().toLocalDate();
		LocalDate rentEnd = rental.getRentEnd().toLocalDate();
		
		int rentdate = rentEnd.getDayOfYear()-rentStart.getDayOfYear()+1;
		
		if(rentEnd.getYear() != rentStart.getYear()) {
			rentdate = 365-rentStart.getDayOfYear()+rentEnd.getDayOfYear()+1;
		};
		
		int rentCost = rentdate*500;
		
		
		rental.setLockerId(lockerId);
		rental.setUserCode(userCode);
		rental.setRentCost(Long.valueOf(rentCost));
		
		// 대여중인데 뚫고 여기까지 왔을시 강등
		if(isRented == 1) {
			rentalService.downGradeMember(userCode);
			return "redirect:/";
		}
		
		
		
		Mileage RantalMileage = new Mileage();
		RantalMileage.setUserCode(userCode);
		RantalMileage.setMileage(rentCost);
		
		
		
		LessorMileage lessorMileage = new LessorMileage();
		lessorMileage.setLockerId(lockerId);
		lessorMileage.setMileage(rentCost);
		
		// 대여 내역 업데이트 & 보관함 상태 업데이트 프로시저
		int insertAndUpdateRental = rentalService.insertAndUpdateRental(rental);
		
		// 빌린사람 마일리지 차감 프로시저
		int selectAndUpdateRentalMileage = rentalService.selectAndUpdateRentalMileage(RantalMileage);
				
		// 빌려준사람 마일리지 증가 프로시저
		int selectAndUpdateLessorMileage = rentalService.selectAndUpdateLessorMileage(lessorMileage);
		
		
		if(insertAndUpdateRental == 0 || selectAndUpdateRentalMileage == 0 ||selectAndUpdateLessorMileage == 0) {
			redirect.addFlashAttribute("procedureConnError", "프로시저 무응답");
			return "redirect:/rentalLocker/rental-form?lockerId="+lockerId;
		}
		
		redirect.addFlashAttribute("success", "success");
		return "redirect:/review/rent-list";
	}
	
	
	
	

}
