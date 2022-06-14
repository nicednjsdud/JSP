<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:redirect url="member.jsp"> <%-- 리다이렉트 할 페이지설정 --%>
		<c:param name="id" value="${'bobdev' }" /> <%-- 리다이렉트할 페이지 로 전달한 매개변수 --%>
		<c:param name="pwd" value="${'0824' }"/>
		<c:param name="name" value="${'정원영' }"/>
		<c:param name="email" value="${'nicednjsdud@네이버' }"/>
	</c:redirect>
</body>
</html>