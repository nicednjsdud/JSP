<%@page import="kr.co.ezenac.member.MemberDAO"%>
<%@page import="kr.co.ezenac.member.MemberBean"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
<jsp:useBean id="m" class="kr.co.ezenac.member.MemberBean" />
<jsp:setProperty property="*" name="m"/>
<% 
	MemberDAO memberDAO = new MemberDAO(); 
	memberDAO.addMember(m);
	List<MemberBean> membersList = memberDAO.listMembers();
	
	request.setAttribute("membersList", membersList);
%>
</head>
<body>
	<jsp:forward page="membersList.jsp" />
</body>
</html>