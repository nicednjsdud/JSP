
<%@page import="kr.co.ezenac.model1.board.dto.BoardDTO"%>
<%@page import="kr.co.ezenac.model1.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 로그인 폼으로부터 받은 아이디와 패스워드
	String userId = request.getParameter("user_id");
	String userPw = request.getParameter("user_pw");
	
	// web.xml에서 가져온 DB 연결 정보
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oralcePwd = application.getInitParameter("OraclePw");
	
	/* BoardDAO dao = new BoardDAO(orac oracleURL,oracleId,oralcePwd);
	BoardDTO memberdto = dao.get(userId, userPw);
	dao.close();
	// 로그인 성공 여부 처리
	if (memberdto.getId() !=null){
		// 로그인 성공
		session.setAttribute("UserId", memberdto.getId());
		session.setAttribute("UserName", memberdto.getName());
		response.sendRedirect("loginForm.jsp");
	}
	else {
		// 로그인 실패
		request.setAttribute("loginErrMsg", "로그인 오류입니다.");
		request.getRequestDispatcher("loginForm.jsp").forward(request, response);
	}
	
	 */
%>