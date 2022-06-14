<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 각 내장 객체에 바인딩된 속성 값들을 getAttribute() 이용해 가져옴 */
/* 	request.setCharacterEncoding("UTF-8");
	String id = (String)request.getAttribute("id");
	String pwd = (String)request.getAttribute("pwd");
	String name = (String)session.getAttribute("name");
	String email = (String)application.getAttribute("email"); */
	
%>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 정보 출력</title>
</head>
<body>
	<table border="1" align="center">
		<tr align="center" bgcolor="#99ccff">
			<td width="7%"><b>아이디</b></td>
			<td width="7%"><b>비밀번호</b></td>
			<td width="5%"><b>이름</b></td>
			<td width="5%"><b>이메일</b></td>
		</tr>
<%-- 		
		<tr align="center">
			<td><%= id %></td>
			<td><%= pwd %></td>
			<td><%= name %></td>
			<td><%= email %></td>
		</tr>					
 --%>	
 		<!-- 자바코드없이 바로 바인딩된 속성이름으로 회원 정보 출력 -->
 		<tr align="center">
 			<td>${id }</td>
 			<td>${pwd }</td>
 			<td>${name }</td>
 			<td>${email }</td>
 		</tr>
 
 	</table>		
</body>
</html>













