<%@page import="kr.co.ezenac.jstl.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean  id="membersList" class="java.util.ArrayList" />
<jsp:useBean id="membersMap" class="java.util.HashMap"/>

<%
	membersMap.put("id","bob");
	membersMap.put("pwd","0824");
	membersMap.put("name","정원영");
	membersMap.put("email","nicednjsdud@gmail.com");
	
	MemberBean m1 = new MemberBean("bob02","08242","정원영2","nicednjsdud2@gamil.com");
	MemberBean m2 = new MemberBean("bob03","08243","정원영3","nicednjsdud3@gamil.com");
	membersList.add(m1);
	membersList.add(m2);
	
	membersMap.put("membersList",membersList);
%>

<!-- HashMap에 저장된 ArrayList에 접근하기 위해 설정 -->
<c:set var="membersList" value="${membersMap.membersList }" />
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
		</tr>
		<tr align="center">
			<td>${membersMap.id }</td>
			<td>${membersMap.pwd }</td>
			<td>${membersMap.name }</td>
			<td>${membersMap.email }</td>
		<tr align="center">
			<td>${membersList[0].id }</td>
			<td>${membersList[0].pwd }</td>
			<td>${membersList[0].name }</td>
			<td>${membersList[0].email }</td>
		</tr>
		<!-- set 태그로 설정한 변수 이름으로 접근 출력 -->	
		<tr align="center">
			<td>${membersList[1].id }</td>
			<td>${membersList[1].pwd }</td>
			<td>${membersList[1].name }</td>
			<td>${membersList[1].email }</td>
		</tr>
		</table>
</body>
</html>