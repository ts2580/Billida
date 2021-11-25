package com.kh.billida.member.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.billida.member.common.SMSSender;
import com.kh.billida.member.common.ValidateResult;
import com.kh.billida.member.common.code.ErrorCode;
import com.kh.billida.member.common.exception.HandlableException;
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

	@InitBinder(value = "joinForm") // model의 속성 중 속성명이 joinForm인 속성이 있는 경우 initBinder 메서드 실행
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(joinFormValidator);
	}

	@GetMapping("signUp")
	public void singUp(Model model) {
		model.addAttribute(new JoinForm()).addAttribute("error", new ValidateResult().getError());
	}

	@PostMapping("/message")
	public @ResponseBody String testMessage(String phonNumber) {
		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		SMSSender.certifiedPhoneNumber(phonNumber, numStr);
		return "/";

	}

	@PostMapping("signUp")
	public String signUp(@Validated JoinForm form, Errors errors, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {

		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());

		if (errors.hasErrors()) {
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

		if (member == null) {
			return "available";
		} else {
			return "disable";
		}
	}

	@GetMapping("nick-check")
	@ResponseBody
	public String nickCheck(String nick) {
		Member member = memberService.selectMemberByNick(nick);

		if (member == null) {
			return "available";
		} else {
			return "disable";
		}
	}

	@GetMapping("login")
	public void login(Model model) {
		// 카카오 로그인시 신규회원용
		model.addAttribute(new JoinForm()).addAttribute("error", new ValidateResult().getError());
	}

	@PostMapping("login")
	public String loginlmpl(Model model, Member member, HttpSession session, RedirectAttributes redirectAttr) {
		Member certifiedUser = memberService.authenticateUser(member);
		System.out.println(member);
		if (certifiedUser == null) {
			redirectAttr.addFlashAttribute("message", "아이디나 비밀번호가 정확하지 않습니다.");
			return "redirect:/member/login";
		}
		
		session.setAttribute("authentication", certifiedUser); // 세션에 올려주기
		session.setAttribute("Id", member.getId());
		logger.debug(certifiedUser.toString());
		return "redirect:/";
	}

	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.removeAttribute("authentication");
		session.removeAttribute("Id");
		return "redirect:/";
	}

	@PostMapping("kakaoLogin")
	public String kakaoLogin(@Validated JoinForm form, Errors errors, Model model, Member member, HttpSession session,
			RedirectAttributes redirectAttr) {
		member = memberService.selectMemberById(form.getId());
		System.out.println("컨트롤러처음" + member);
		if (member != null && member.getName() != null) {
			Member certifiedUser = memberService.authenticateUser(member);
			session.setAttribute("authentication", certifiedUser);
			return "redirect:/";
		}

		System.out.println("여긴 멤버컨트롤러 처음" + form.toString());
		System.out.println("멤버서비스들어간다릿!" + form.toString());
		if (member == null) {
			memberService.insertMember(form);
		}
		System.out.println("카카오회원가입초기 이후 멤버값" + form.toString());
		System.out.println("폼에들어가는 아이디여" + form.getId());
		member = memberService.selectMemberById(form.getId());
		System.out.println(member);
		Member certifiedUser = memberService.authenticateUser(member);
		session.setAttribute("authentication", certifiedUser); // 세션에 올려주기
		return "redirect:/member/kakaoSignup";

	}

	@GetMapping("kakaoSignup")
	public void kakaoSignup(@Validated JoinForm form, Model model) {
		model.addAttribute(new JoinForm()).addAttribute("error", new ValidateResult().getError());
		System.out.println("겟매핑에서 폼" + form);
	}

	@PostMapping("kakaoSignup")
	public String kakaoSignup(@Validated JoinForm form, Errors errors, Member member, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {
		ValidateResult vr = new ValidateResult();
		System.out.println("오너라!");
		model.addAttribute("error", vr.getError());
		System.out.println(errors);
		if (errors.hasErrors()) {
			vr.addError(errors);
			return "member/kakaoSignup";
		}
		System.out.println("폼에 들어가나?" + form);
		memberService.updateMember(form);
		return "redirect:/";
	}

	@GetMapping("/check")
	public String check(Member member, HttpSession session, RedirectAttributes redirectAttr) {

		if (session.getAttribute("authentication") == null) {
			redirectAttr.addFlashAttribute("message", "로그인 후 이용 가능합니다");
			return "redirect:/member/login";
		}
		Member user = (Member) session.getAttribute("authentication");
		if (user.getKakaoNum() == null) {
			return "member/check";
		}
		return "member/kakaoChange";
	}

	
	@PostMapping("check")
	public String passwordCheck(@ModelAttribute Member member, Errors errors, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {
		//빠른 테스트를 위해 잠시 주석처리
		/*
		 * if (memberService.checkPassword(member.getPassword(), session)) { return
		 * "member/mypage"; } else { redirectAttr.addFlashAttribute("message",
		 * "비밀번호가 정확하지 않습니다."); return "redirect:/member/check"; }
		 */
		return "member/mypage";
	}

	@GetMapping("delete")
	public String delete(Member member, HttpSession session) {
		Member deleteUser = (Member) session.getAttribute("authentication");
		System.out.println("멤버값 나와라 뿅" + deleteUser);
		memberService.deleteMember(deleteUser.getUserCode());
		logout(session);
		return "redirect:/";
	}

	@PostMapping("update")
	public String updateMember(@Validated JoinForm form, Errors errors, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {

		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		if (errors.hasErrors()) {
			vr.addError(errors);
			return "member/mypage";
		}

		System.out.println(form);
		memberService.updateMember(form);
		return "redirect:/";
	}

	@GetMapping("findId")
	public void findId() {
	}

	@PostMapping("findIdByEmail")
	public String findIdByEmail(Model model, Member member, HttpSession session, RedirectAttributes redirectAttr) {
		System.out.println(member);
		Member checkUser = memberService.findIdByEmail(member);
		if (checkUser == null) {
			redirectAttr.addFlashAttribute("message", "입력하신 정보를 확인해주세요");
			return "redirect:/member/findId";
		}
		checkUser.setName(member.getName());
		checkUser.setEmail(member.getEmail());
		System.out.println("리포지토리에서 불러온 아이디값" + checkUser);
		memberService.sendIdByEmail(checkUser);

		return "redirect:/";
	}

	@GetMapping("findPassword")
	public void findPassword() {
	}

	@PostMapping("findPasswordByEmail")
	public String findPasswordByEmail(Model model, Member member, HttpSession session,
			RedirectAttributes redirectAttr) {
		System.out.println(member);
		Member checkUser = memberService.findPasswordByEmail(member);
		if (checkUser == null) {
			redirectAttr.addFlashAttribute("message", "입력하신 정보를 확인해주세요");
			return "redirect:/member/findPassword";
		}
		System.out.println("리포지토리에서 불러온 아이디값" + checkUser);
		String token = UUID.randomUUID().toString();
		session.setAttribute("persistToken", token);
		memberService.sendPasswordByEmail(checkUser, token);

		return "redirect:/";
	}



	@GetMapping("findPasswordBy_Email/{token}_{id}")
	public String checkToken(@PathVariable String token,@PathVariable String id,
			@SessionAttribute(value = "persistToken", required = false) String persistToken, HttpSession session,
			RedirectAttributes redirectAttrs, Member member) {
		System.out.println("메일에서 아이디값"+id);
		System.out.println("여기와짐?1ㅋㅋ");
		if (!token.equals(persistToken)) {
			throw new HandlableException(ErrorCode.AUTHENTICATION_FAILED_ERROR);
		}
		System.out.println("여기와짐?2ㅋㅋ");
		System.out.println("아이디"+id);
		member = memberService.selectMemberById(id);
		System.out.println("멤버"+member);
		Member certifiedUser = memberService.changePasswordByEmail(member);
		System.out.println("세션에 올리는 멤버"+certifiedUser);
		session.setAttribute("authentication", certifiedUser);
		session.removeAttribute("persistToken"); 
		return "redirect:/member/changePasswordByEmail";
	}

	@GetMapping("changePasswordByEmail")
	public void a() {}

	@PostMapping("changePasswordByEmail")
	public String changePasswordByEmail(@Validated JoinForm form, Errors errors, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		System.out.println("여기까지오면 거의 끝난거다");
		System.out.println(errors);
		if (errors.hasErrors()) {
			vr.addError(errors);
			return "member/changePasswordByEmail";
		}
		Member member = (Member) session.getAttribute("authentication");
		System.out.println("멤버서비스에 들어갈 멤버"+member);
		System.out.println("멤버서비스에 들어갈 폼"+form);
		memberService.updatePasswordByEmail(form,member);
		logout(session);
		return "redirect:/";
	}
	@PostMapping("password")
	public String updatePassword(@Validated JoinForm form, Errors errors, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		if (errors.hasErrors()) {
			vr.addError(errors);
			return "member/mypage";
		}
		memberService.updatePassword(form);
		return "redirect:/";
	}

	@PostMapping("changeName")
	public String updateName(@ModelAttribute JoinForm form, RedirectAttributes redirectAttr, HttpSession session) {
		System.out.println(form);
		if(form.getName()!=null) {
		Member user = (Member) session.getAttribute("authentication");
		System.out.println(user);
		memberService.updateName(form,user);
		}
		return "redirect:/member/check";
	}

	@PostMapping("changeNick")
	public String updateNick(@Validated JoinForm form, Errors errors, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {
		ValidateResult vr = new ValidateResult();
		System.out.println("씨발 답답하다"+form);
		System.out.println(errors);
		  model.addAttribute("error", vr.getError()); if (errors.hasErrors()) {
		  vr.addError(errors); 
		  return "redirect:/member/check";
		  }
		Member user = (Member) session.getAttribute("authentication");
		memberService.updateNick(form,user);
		return "redirect:/member/check";
	}

	@PostMapping("changeTel")
	public String updateTel(@Validated JoinForm form, Errors errors, Model model, RedirectAttributes redirectAttr, HttpSession session) {
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		System.out.println("답답하다 phone: "+form);
		System.out.println(errors);
		if (errors.hasErrors()) {
			vr.addError(errors);
			return "redirect:/member/check";
		}
		Member user = (Member) session.getAttribute("authentication");
		memberService.updateTel(form,user);
		return "redirect:/member/check";
	}

	@PostMapping("changeEmail")
	public String updateEmail(@ModelAttribute JoinForm form,  HttpSession session, Model model, RedirectAttributes redirectAttr) {
		Member user = (Member) session.getAttribute("authentication");
		System.out.println(user);
		memberService.updateEmail(form,user);
		return "redirect:/member/check";
		
	}

	@PostMapping("changeAddress")
	public String updateAddress(@ModelAttribute JoinForm form, HttpSession session, Errors errors, Model model, RedirectAttributes redirectAttr) {
		Member user = (Member) session.getAttribute("authentication");
		memberService.updateAddress(form,user);
		return "redirect:/member/check";
	}
	@PostMapping("kakaoChange")
	public String kakaoChange(@Validated JoinForm form, Errors errors, Member member, Model model, HttpSession session,
			RedirectAttributes redirectAttr) {
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		if (errors.hasErrors()) {
			vr.addError(errors);
			return "member/kakaoSignup";
		}
		Member user = (Member) session.getAttribute("authentication");
		System.out.println("멤버값"+user);
		System.out.println("폼값" + form);
		memberService.changeKakaoMember(form,user);
		return "redirect:/";
	
	}
	
	@GetMapping("admin")
	public String admin(Model model, HttpSession session, RedirectAttributes redirectAttr) {
		
		List<Member> memberList = memberService.selectMember();		
		session.setAttribute("memberList", memberList);
		session.setAttribute("size", memberList.size());
		return "member/admin";
	}
	
	@PostMapping("searchMember")
	public String searchMember(@ModelAttribute Member member, Model model) {
		
		memberService.selectMemberById(member.getId());
		return "member/admin";
	}

}