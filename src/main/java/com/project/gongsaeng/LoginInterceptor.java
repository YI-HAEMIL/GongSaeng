package com.project.gongsaeng;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 1) session 객체 가져오기
		HttpSession session = request.getSession(false);
		
		// 2) Login 확인하기 > 결과 처리
		if (session != null && session.getAttribute("loginID") != null) {
			// Login 되어있음 > Controller 처리
			return true;
			
		} else { // Login 안 되어있음 > Login 유도
			// 2.1) redirect (loginForm 요청)
			// response.sendRedirect("/green/mloginf");
			// 2.2) forward
			request.setAttribute("msg", "로그인이 필요한 서비스입니다");
			String url = "/WEB-INF/views/mytarget/mloginForm.jsp";
			request.getRequestDispatcher(url).forward(request, response);
			return false;
		}
	}
}
