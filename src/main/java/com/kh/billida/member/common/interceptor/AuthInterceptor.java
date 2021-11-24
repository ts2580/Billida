package com.kh.billida.member.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.billida.member.common.code.ErrorCode;
import com.kh.billida.member.common.exception.HandlableException;
import com.kh.billida.member.model.dto.Member;

public class AuthInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest httpRequest, HttpServletResponse httpResponse, Object handler) {

		String[] uriArr = httpRequest.getRequestURI().split("/");

		if (uriArr.length != 0) {

			switch (uriArr[1]) {
			case "member":
				memberAuthorize(httpRequest, httpResponse, uriArr);
				break;
			case "review":
				reviewAuthorize(httpRequest, httpResponse, uriArr);
				break;
			default:
				break;
			}
		}

		// 다음 인터셉터 또는 컨트롤러에게 요청을 전달
		return true;
	}


	private void reviewAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr) {
		HttpSession session = httpRequest.getSession();
		Member member = (Member) session.getAttribute("authentication");
		
		switch (uriArr[2]) {
		case "review-list":
			if(member == null) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR.setURL("/member/login"));
			}
			break;
		case "rent-list":
			if(member == null) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR.setURL("/member/login"));
			}
			break;
		default:
	         break;
		}
		
	}


	private void memberAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr) {
		HttpSession session = httpRequest.getSession();
		switch (uriArr[2]) {
		
		case "mypage":
			if (session.getAttribute("authentication") == null) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR);
			}			
			break;
		/*
		 * case "kakaoSignup": if (session.getAttribute("authentication") == null) {
		 * throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR); }
		 * 
		 * break;
		 */
		/*
		 * case "kakaoLogin": if (session.getAttribute("authentication") == null) {
		 * throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR); }
		 * 
		 * break;
		 */
		default:
			break;
		}
	}

}