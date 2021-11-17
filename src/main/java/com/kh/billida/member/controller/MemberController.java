package com.kh.billida.member.controller;

import java.util.Iterator;
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

	    ValidateResult vr = new ValidateResult();
	    model.addAttribute("error", vr.getError());

	    if(errors.hasErrors()) {      
	         vr.addError(errors);
	         return "member/signUp";
	      }
	    memberService.insertMember(form);
	    return "redirect:/";
	}
	   @GetMapping("id-check")
	   @ResponseBody
	   public String idCheck(String id) {
	      Member member = memberService.selectMemberById(id);
	      
	      if(member == null) {
	         return "available"; 
	      }else {
	         return "disable";
	      }
	   }
	   @GetMapping("nick-check")
	   @ResponseBody
	   public String nickCheck(String nick) {
	      Member member = memberService.selectMemberByNick(nick);
	      
	      if(member == null) {
	         return "available"; 
	      }else {
	         return "disable";
	      }
	   }
	   @GetMapping("login")
		public void login(Model model) {
		   //카카오 로그인시 신규회원용
		   model.addAttribute(new JoinForm()).addAttribute("error",new ValidateResult().getError());
		}
	   
	   @PostMapping("login")
		public String loginlmpl( Model model, Member member, HttpSession session, RedirectAttributes redirctAttr){
			Member certifiedUser = memberService.authenticateUser(member);
			System.out.println(member);
			if(certifiedUser == null) {
				redirctAttr.addFlashAttribute("message","아이디나 비밀번호가 정확하지 않습니다.");
				return "redirect:/member/login";
			}
			
			
			session.setAttribute("authentication", certifiedUser); //세션에 올려주기
			logger.debug(certifiedUser.toString());
			return "redirect:/";
		}
	   @GetMapping("logout")
		public String logout(HttpSession session) {
		   session.removeAttribute("authentication");
		   return"redirect:/";
		}
	   @PostMapping("kakaoLogin")
	   public String kakaoLogin(@Validated JoinForm form
				,Errors errors
			     ,Model model
				,Member member
				,HttpSession session
				,RedirectAttributes redirectAttr) {
		   member = memberService.selectMemberById(form.getId());
		   System.out.println("컨트롤러처음"+member);
		   if(member!=null&&member.getName()!=null) {
			   Member certifiedUser = memberService.authenticateUser(member);
			    session.setAttribute("authentication", certifiedUser);
			   return"redirect:/";
			   }
		   
		   System.out.println("여긴 멤버컨트롤러 처음"+form.toString());
		   System.out.println("멤버서비스들어간다릿!"+form.toString());
		   if(member==null) { 
		   memberService.insertMember(form);
		   }
		    System.out.println("카카오회원가입초기 이후 멤버값"+form.toString());
		    System.out.println("폼에들어가는 아이디여"+form.getId());
		    member = memberService.selectMemberById(form.getId());
		    System.out.println(member);
		    Member certifiedUser = memberService.authenticateUser(member);
		    session.setAttribute("authentication", certifiedUser); //세션에 올려주기
		    return "redirect:/member/kakaoSignup";
		    
		}
	   @GetMapping("kakaoSignup")
	   public void kakaoSignup(@Validated JoinForm form,Model model) {
		   model.addAttribute(new JoinForm()).addAttribute("error",new ValidateResult().getError());
		   System.out.println("겟매핑에서 폼"+form);
	   }
	   
		@PostMapping("kakaoSignup")
		public String kakaoSignup(@Validated JoinForm form
										,Errors errors
										,Member member
										,Model model
										,HttpSession session
										,RedirectAttributes redirectAttr) {
		    ValidateResult vr = new ValidateResult();
		    model.addAttribute("error", vr.getError());
		    if(errors.hasErrors()) {      
		         vr.addError(errors);
		         return "member/kakaoSignup";
		    }
		    System.out.println("폼에 들어가나?"+form);
		    memberService.updateMember(form);
		    return "redirect:/";
		}
}