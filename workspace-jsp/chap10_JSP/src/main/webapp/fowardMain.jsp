<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("pAttr", "이방원");
	request.setAttribute("rAttr", "이도");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 테그 - forward</title>
</head>
<body>
	<h2>액션 태그를 이용한 포워딩</h2>
	<jsp:forward page="forwardSub.jsp" />
</body>
</html>