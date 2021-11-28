package com.kh.billida.member.common.sessionManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class testController {
	
	@PostMapping("checkForDuplicateSessions")
	public String login(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) throws Exception {
		String id = request.getParameter("id");
		if(id != null){
			String userId = SessionConfig.getSessionidCheck("login_id", id);
			System.out.println(id + " : " +userId);
			session.setMaxInactiveInterval(60 * 60);
			session.setAttribute("login_id", id);
			return "redirect:/";//로그인되었을 경우 가야하는 경로
		}
		return "redirect:/member/login";//아니라면 가야하는 경우
	}
	
	@GetMapping("login")
	public void index(HttpSession session) throws Exception {
	}
	
}