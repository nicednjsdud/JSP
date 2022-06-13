<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 변수 선언 -->
<c:set var="scopeVar" value="PageValue" />
<c:set var="scopeVar" value="RequestValue" scope="request" />
<c:set var="scopeVar" value="SessionValue" scope="session"/>
<c:set var="scopeVar" value="ApplicationValue" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - remove</title>
</head>
<body>
	<h4>출력하기</h4>
	<ul>
		<li>scopeVar : ${scopeVar }</li> 
		<!-- 영역을 지정하지 않으면 가장 좁은 영역인 page 영역이 지정 -->
		
		<li>requestScope.scopeVar : ${requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar } </li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar }</li>
	</ul>
	
	<h4>session 영역에서 삭제하기</h4>
	<c:remove var="scopeVar" scope="session" />
	<ul>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar } </li>
	</ul>
	
	<h4>scope 지정없이 삭제하기</h4>
	<c:remove var="scopeVar"/>
	<ul>
		<li>scopeVar : ${scopeVar }</li> 		
		<li>requestScope.scopeVar : ${requestScope.scopeVar }</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar } </li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar }</li>
	</ul>
</body>
</html>