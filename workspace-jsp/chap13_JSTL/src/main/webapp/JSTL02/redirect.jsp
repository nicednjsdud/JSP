<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - redirect </title>
</head>
<body>
	<c:set var="requestVar2" value="밥블로그" scope="request" />
	<!-- 리다이렉트는 포워드와 달리 request 영역은 공유되지 않음 -->
	<c:redirect url="/JSTL02/inc/otherPage.jsp">
		<c:param name="userParam1" value="BoB's Blog" />
		<c:param name="userParam2" value="밥쓰 블로그" />
	</c:redirect>
</body>
</html>