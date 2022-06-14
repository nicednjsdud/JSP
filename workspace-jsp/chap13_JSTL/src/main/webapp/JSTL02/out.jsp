<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - OUT </title>
</head>
<body>
	<c:set var="iTag" > i 태그는 <i>기울임</i>을 표현합니다.</c:set>
	<c:out value="${iTag }" />
	
	<h4>escapeXml 속성</h4>
	<c:out value="${iTag }" escapeXml="false"/>
	
	<h4>default 속성</h4>
	<!-- 변수값이 null인 경우이므로 default 속성값이 출력됨 -->
	<c:out value="${param.name }" default="empty" />
	
	<h4>빈 문자열일때<h4>
	<!-- 빈 문자열도 하나의 값이므로(null이 아님) 
			default 속정에 지정한 값이 출력되지 않음 -->
	<c:out value="" default="출력이 안되네요" />
</body>
</html>