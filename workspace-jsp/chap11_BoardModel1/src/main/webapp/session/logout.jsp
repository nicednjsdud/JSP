<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 회원 인증 정보 속성 삭제
	//session.removeAttribute("UserId");
	//session.removeAttribute("UserName");
	
	// 모든 속성을 한꺼번에 삭제
	session.invalidate();
	
	// 페이지 이동
	response.sendRedirect("loginForm.jsp");
%>