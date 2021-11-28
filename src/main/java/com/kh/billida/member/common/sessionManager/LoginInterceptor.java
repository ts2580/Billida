package com.kh.billida.member.common.sessionManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		final HttpSession session = request.getSession();
		String path = request.getRequestURI();
		//접근 경로가 로그인인 경우와 메인경로일땐 interceptor 체크 예외
		if(path.contains("/")||path.contains("/member/login") || path.contains("/member/checkForDuplicateSessions")) { 
			return true;
		}//접근경로로 접근하지 않았을때 세션에 아이디값이 없다면 /member/login으로 보냄. 
		else if (session.getAttribute("login_id") == null) {  //세션 로그인이 없으면 리다이렉트 처리 이게 진짜로 세션제거 한 후에 새로고침했을때 메인으로 이동시키는 메서드
			response.sendRedirect("/member/login");
			return false;
		}
		//로그인 되었을경우는 참
		return true;
	}
}