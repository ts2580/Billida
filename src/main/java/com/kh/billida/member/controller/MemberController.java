package com.kh.billida.member.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.billida.member.common.SMSSender;
import com.kh.billida.member.common.ValidateResult;
import com.kh.billida.member.model.dto.Member;
import com.kh.billida.member.model.service.MemberService;
import com.kh.billida.member.validator.JoinForm;
import com.kh.billida.member.validator.JoinFormValidator;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("member")
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final MemberService memberService;
    private final JoinFormValidator joinFormValidator;

    @InitBinder(value = "joinForm") //model의 속성 중 속성명이 joinForm인 속성이 있는 경우 initBinder 메서드 실행
    public void initBinder(WebDataBinder webDataBinder) {
       webDataBinder.addValidators(joinFormValidator);
    }
    
	@GetMapping("signUp")
	public void singUp(Model model) {
		model.addAttribute(new JoinForm()).addAttribute("error",new ValidateResult().getError());
	}
	
	@PostMapping("/message")
	public @ResponseBody String testMessage(String phonNumber) {
		Random rand = new Random();
		String numStr ="";
		for (int i = 0; i < 6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		SMSSender.certifiedPhoneNumber(phonNumber,numStr);
		return "/";
				
	}
	
	@PostMapping("signUp")
	public String signUp(@Validated JoinForm form
									,Errors errors
									,Model model
									,HttpSession session
									,RedirectAttributes redirectAttr) {
		//입력데이터를 못끌고옴 ㅠ
		//System.out.println(member.toString());
		
		//memberService.insertMember(member);
	    ValidateResult vr = new ValidateResult();
	    model.addAttribute("error", vr.getError());

	    if(errors.hasErrors()) {      
	         vr.addError(errors);
	         return "member/signUp";
	      }
	    memberService.insertMember(form);
	    return "redirect:/";
	}
	@GetMapping("/test")
	public void test() {
		
	}
	   @GetMapping("id-check")
	   @ResponseBody
	   public String idCheck(String id) {
	      Member member = memberService.selectMemberByUserId(id);
	      
	      if(member == null) {
	         return "available"; 
	      }else {
	         return "disable";
	      }
	   }
}
