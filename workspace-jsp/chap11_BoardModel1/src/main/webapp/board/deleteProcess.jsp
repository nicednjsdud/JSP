<%@page import="kr.co.ezenac.model1.board.dao.BoardDAO"%>
<%@page import="kr.co.ezenac.model1.board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 로그인 확인 --%>    
<%@ include file="./isLoggedIn.jsp" %>

<%
	String num = request.getParameter("num");
	
	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO(application);
	dto = dao.selectView(num);
	
	// 로그인된 사용자 id 얻기
	String sessionId = session.getAttribute("UserId").toString();
	
	int delResult =0;
	
	// 작성자가 본인인지 확인
	String id =  dto.getId();
	if(sessionId.equals(id)){
		// 작성자가 본인이면
		dto.setNum(num);
		delResult = dao.deletePost(dto);		// 삭제!
		dao.close();
		
		// 성공 여부 처리
		if(delResult == 1){
			// 성공시 목록 페이지로 이동
			JsFunction.alertLocation("삭제되었습니다.","./list.jsp",out);
		}
		else{
			// 실패시 이전 페이지로 이동
			JsFunction.alertBack("삭제에 실패하였습니다.", out);
		}
	}
	else{
		// 작성자 본인이 아니라면 이전페이지로 이동
		JsFunction.alertBack("본인만 삭제할 수 있습니다.", out);
		return;
	}
%>












