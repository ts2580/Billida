package com.kh.billida.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.billida.member.model.dto.Member;
import com.kh.billida.member.model.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("member")
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final MemberService memberService;
	
	@GetMapping("/signUp")
	public void singUp() {		
		
	}
	
	@PostMapping("signUp")
	public String join(@Validated Member member) {
		memberService.insertMember(member);
		
		return "/";
	}
	
}
