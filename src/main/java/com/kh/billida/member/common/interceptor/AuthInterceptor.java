package com.kh.billida.member.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.kh.billida.main.model.service.MainService;
import com.kh.billida.member.common.code.ErrorCode;
import com.kh.billida.member.common.exception.HandlableException;
import com.kh.billida.member.model.dto.Member;
import com.kh.billida.mileage.model.dto.Mileage;
import com.kh.billida.mileage.model.service.MileageService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class AuthInterceptor implements HandlerInterceptor {
	
	private final MileageService mileageService;

	@Override
	public boolean preHandle(HttpServletRequest httpRequest, HttpServletResponse httpResponse, Object handler) {
		HttpSession session = httpRequest.getSession();
		Member member = (Member) session.getAttribute("authentication");
		
		if(member != null) {
			Mileage userMileage = mileageService.selectUserMileage(member.getUserCode()); //내 마일리지 정보 가져오기
			session.setAttribute("userMileage", userMileage); //어느페이지로 이동하던 헤드에 현재 마일리지 정보가 출력되도록
		}
		
		String[] uriArr = httpRequest.getRequestURI().split("/");

		if (uriArr.length != 0) {

			switch (uriArr[1]) {
			case "member":
				memberAuthorize(httpRequest, httpResponse, uriArr);
				break;
			case "review":
				reviewAuthorize(httpRequest, httpResponse, uriArr);
				break;
			case "mileage":
				mileageAuthorize(httpRequest, httpResponse, uriArr);
				break;
			default:
				break;
			}
		}

		// 다음 인터셉터 또는 컨트롤러에게 요청을 전달
		return true;
	}


	private void mileageAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr) {
		HttpSession session = httpRequest.getSession();
		Member member = (Member) session.getAttribute("authentication");
		
		switch (uriArr[2]) {
		case "update-mileage":
			if(member == null) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR);
			}
			break;
		case "mileageInfo":
			if(member == null) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR);
			}
			break;
		default:
	         break;
		}
		
	}


	private void reviewAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr) {
		HttpSession session = httpRequest.getSession();
		Member member = (Member) session.getAttribute("authentication");
		
		switch (uriArr[2]) {
		case "review-list":
			if(member == null) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR);
			}
			break;
		case "rent-list":
			if(member == null) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR);
			}
			break;
		case "myLocker-list":
			if(member == null) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR);
			}
			break;
		case "locker-reviews":
			if(member == null) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR);
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