<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core 태그 라이브러리를 사용하기 위해 반드시 선언해야 함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- 변수 선언. value 속성에는 표현언어 사용해 초기화할 수 있다. -->
<c:set var="id" value="bob" scope="page" />
<c:set var="pwd" value="0824" />
<%-- <c:set var="name" value="${'정원영'}" />--%>
<c:set var="age" value="${26 }" />
<c:set var="height" value="${181 }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 출력</title>
</head>
<body>
	<table border="1" aling="center">
		<tr align="center" bgcolor="#99ccff">
			<td width="7%"><b>아이디</b></td>
			<td width="7%"><b>비밀번호</b></td>
			<td width="7%"><b>이름</b></td>
			<td width="7%"><b>나이</b></td>
			<td width="7%"><b>키</b></td>
		</tr>
		
		<c:choose>
			<c:when test="${empty name }">
				<tr align="center">
					<td colspan="5">이름을 입력하세요!</td>
				</tr>
			</c:when>
			<c:otherwise>
			<!-- 표현언어로 변수에 바로 접근하여 값 출력 -->
		<tr align="center">
			<td>${id }</td>
			<td>${pwd }</td>
			<td>${name }</td>
			<td>${age }</td>
			<td>${height }</td>
		</tr>
			</c:otherwise>
		</c:choose>
		
		
	</table>
</body>
</html>