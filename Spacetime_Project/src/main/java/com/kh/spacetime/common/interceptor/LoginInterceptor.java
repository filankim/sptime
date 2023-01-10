package com.kh.spacetime.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	// 선처리용 preHandle 메소드 오버라이딩
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		// 로그인 유무 검사를 위한 Session 객체 얻어내기
		HttpSession session = request.getSession();
		
		// loginMember 키값이 있나 검사
		if(session.getAttribute("loginMember") != null) {
			// 현재 요청을 보낸 사람이 로그인되어 있는 상태라면
			// => Controller가 실행
			return true;
		} else {
			// 현재 요청을 보낸 사람이 로그인이 되어 있지 않은 상태라면
			// => Controller 실행 막기
			
			// alertMsg로 "로그인 한 회원만 이용 가능하다"는 알람 메시지 띄우기
			session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
			
			// 응답 뷰 지정(메인페이지로 url 재요청)
			response.sendRedirect(request.getContextPath());
			
			return false;
		}
		
	}
	
}
