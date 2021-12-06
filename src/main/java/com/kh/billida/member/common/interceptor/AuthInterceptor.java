package com.kh.billida.member.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.billida.member.common.code.ErrorCode;
import com.kh.billida.member.common.exception.HandlableException;
import com.kh.billida.member.model.dto.Member;
import com.kh.billida.mileage.model.dto.Mileage;
import com.kh.billida.mileage.model.service.MileageService;

import lombok.RequiredArgsConstructor;

@Component
public class AuthInterceptor implements HandlerInterceptor {

	@Autowired
	private MileageService mileageService;

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
			case "support":
				supportAuthorize(httpRequest, httpResponse, uriArr);
				break;	
			case "rentLocker":
				rentAuthorize(httpRequest, httpResponse, uriArr);
				break;
			case "rentalLocker":
				rentalAuthorize(httpRequest, httpResponse, uriArr);
				break;
			default:
				break;
			}
		}

		// 다음 인터셉터 또는 컨트롤러에게 요청을 전달
		return true;
	}


	private void supportAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr) {
		HttpSession session = httpRequest.getSession();
		Member member = (Member) session.getAttribute("authentication");
		
		switch (uriArr[2]) {
		case "report-board":
			if(member == null) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR);
			}
			break;
		case "report-detail":
			if(member == null || member.getGrade().equals("01") || member.getGrade().equals("00")) {
				throw new HandlableException(ErrorCode.UNAUTHORIZED_PAGE_ERROR);
			}
			break;
		case "report-main":
			if(member == null) {
				throw new HandlableException(ErrorCode.USER_LOGIN_NEEDED.setURL("/member/login"));
			}
			break;
		case "support-index":
			if(member == null) {
				throw new HandlableException(ErrorCode.USER_LOGIN_NEEDED.setURL("/member/login"));
			}
			break;
		default:
	         break;
		}
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
		Member member = (Member) session.getAttribute("authentication");
		switch (uriArr[2]) {
				
		case "login":
			if (session.getAttribute("authentication") != null) {
				throw new HandlableException(ErrorCode.WRONG_PATH_ERROR);
			}			
			break;
		case "signUp":
			if (session.getAttribute("authentication") != null) {
				throw new HandlableException(ErrorCode.WRONG_PATH_ERROR);
			}			
			break;
		case "findId":
			if (session.getAttribute("authentication") != null) {
				throw new HandlableException(ErrorCode.WRONG_PATH_ERROR);
			}			
			break;
		case "findPassword":
			if (session.getAttribute("authentication") != null) {
				throw new HandlableException(ErrorCode.WRONG_PATH_ERROR);
			}			
			break;
		case "mypage":
			if (session.getAttribute("authentication") == null) {
				throw new HandlableException(ErrorCode.USER_LOGIN_NEEDED);
			}
			break;
		case "change":
			if (session.getAttribute("authentication") == null) {
				throw new HandlableException(ErrorCode.USER_LOGIN_NEEDED);
			}			
			break;
		case "kakaoChange":
			if (session.getAttribute("authentication") == null) {
				throw new HandlableException(ErrorCode.USER_LOGIN_NEEDED);
			}			
			break;
		case "check":
			 if(member==null) {
				 throw new HandlableException(ErrorCode.USER_LOGIN_NEEDED);
			 }else if(member.getGrade().equals("00")){
				 throw new HandlableException(ErrorCode.STOP_ID.setURL("/support/support-index"));
			 }
			 break;
		default:
			break;
		}
	}
	
	private void rentAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr) {
		HttpSession session = httpRequest.getSession();
		Member member = (Member) session.getAttribute("authentication");
		
		if(member == null && uriArr[2].equals("rent-form")) {
				throw new HandlableException(ErrorCode.USER_LOGIN_NEEDED.setURL("/member/login"));
			};		
	}
	
	private void rentalAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr) {
		HttpSession session = httpRequest.getSession();
		Member member = (Member) session.getAttribute("authentication");
		
		if(member == null && uriArr[2].equals("rental-form")) {
				throw new HandlableException(ErrorCode.USER_LOGIN_NEEDED.setURL("/member/login"));
		};
	}

}