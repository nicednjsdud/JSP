<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - URL</title>
</head>
<body>
	<c:url value="/JSTL02/inc/otherPage.jsp" var="url">
		<c:param name="userParam1" value="BOB!" />
		<c:param name="userParam2">Hello JSTL!</c:param>
	</c:url>
	<a href="${ url}">otherPage.jsp 바로가기</a>
</body>
</html>