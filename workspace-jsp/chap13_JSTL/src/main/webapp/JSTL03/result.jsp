<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 화면</title>
</head>
<body>
	<%-- empty 연산자 이용해서 id 값 비었는지 체크 --%>
	<c:if test="${empty param.userId }">
		아이디를 입력하세요. <br>
		<a href="login.jsp">로그인 창</a>
	</c:if>
	<%-- id를 정상적으로 입력한 경우 로그인 메세지 출력 --%>
	<c:if test="${not empty param.userId }">
		<h1>환영합니다.<c:out value="${param.userId }" /> 님!</h1>
		
	</c:if>
</body>
</html>