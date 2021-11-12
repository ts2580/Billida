package com.kh.billida.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.billida.member.model.dto.Member;
import com.kh.billida.member.model.service.MemberService;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kh.billida.member.common.SMSSender;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("member")
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final MemberService memberService;
	
	@GetMapping("/signUp")
	public void singUp() {}
	
	@PostMapping("/signUp")
	public @ResponseBody String smsMessage(String phoneNumber) {
		Random rand = new Random();
		String num ="";
		for (int i = 0; i < 6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			num += ran;
		}
		SMSSender.certifiedPhoneNumber(phoneNumber,num);
		return "/";
				
	}
	
	@PostMapping("signUp")
	public String join(@Validated Member member) {
		memberService.insertMember(member);
		
		return "/";
	}
	
}
