<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String UserId = request.getParameter("userId");
	session.setAttribute("userId", UserId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 확인</h1>
<%=UserId %> 님이 로그했습니다.
</body>
</html>