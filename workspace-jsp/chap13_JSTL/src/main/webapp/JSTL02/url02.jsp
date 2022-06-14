<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:url var="url1" value="member2.jsp" >
	<c:param name="id" value="BoB222222"/>
	<c:param name="pwd" value="0824"/>
	<c:param name="name" value="개발자 정원영"/>
	<c:param name="email" value="BoB222222@gmail.com"/>
</c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - URL</title>
</head>
<body>
	
	<a href="${url1}/JSTL02/member2.jsp"  >회원정보 출력 </a>
</body>
</html>