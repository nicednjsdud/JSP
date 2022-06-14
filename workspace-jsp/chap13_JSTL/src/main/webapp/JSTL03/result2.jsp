<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과화면</title>
</head>
<body>
	<c:if test="${empty param.userId }">
		아이디를 입력하세요.<br>
		<a href="login.jsp">로그인 창</a>
	</c:if>
	<c:if test="${not empty param.userId }"> 	<%-- id가 null 아님 체크 --%>	
		<c:if test="${param.userId == 'admin'}">
			<h1>관리자로 로그인 했습니다.</h1>
			<form action="#">
			
			<input style="margin-right: 10px;" type="button" value="회원 정보 삭제하기" onclick="location.href='remove.jsp'" />
			<input type="button" value="회원 정보 수정하기" onclick="location.href='update.jsp'"/>
			</form>
		</c:if>
		<c:if test="${param.userId != 'admin'}"> <%-- id가 admin이 아니면 출력 --%>
			<h1>안녕하세요 ! </h1>
			<c:out value="${param.userId }" />
		</c:if>
	</c:if>
</body>
</html>