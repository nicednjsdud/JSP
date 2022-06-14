<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반복문</title>
</head>
<body>
	<!-- 반복 변수 i를 1부터 10까지 1씩 증가시키면서 반복문 수행 -->
	<c:forEach var="i" begin="1" end="10" step="1" varStatus="loop">
		i = ${i } &nbsp;&nbsp;&nbsp; 반복횟수 : ${loop.count }<br/>
	</c:forEach>
	<br/>
	
</body>
</html>