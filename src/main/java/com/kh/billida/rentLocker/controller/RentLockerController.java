package com.kh.billida.rentLocker.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.billida.member.model.dto.Member;
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
		
		
	}
	
	@PostMapping("rent-form")
	public String rentalForm(HttpSession session, Member member){
		
		member = (Member)session.getAttribute("authentication");
		
		return "redirect:/rental/rental-form?lockerId=";
	}
	
	
}