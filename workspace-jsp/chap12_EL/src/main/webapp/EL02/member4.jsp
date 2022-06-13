<%@page import="kr.co.ezeanac.el.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>    

	<!-- 회원정보를 저장할 빈 생성  -->
<jsp:useBean id="m1" class="kr.co.ezeanac.el.MemberBean" />
	<!-- 전송된 회원 정보를 빈의 속성에 설정 -->
<jsp:setProperty property="*" name="m1"/>
	<!-- membersList로 ArrayList 객체 생성 -->
<jsp:useBean id="membersList" class="java.util.ArrayList" />

<%
	/* 자바로 코드로 새 회원 정보를 저장하는 객체 생성 */
	MemberBean m2 = new MemberBean("ezenac5","0824","이젠5", "ezenac5@gmail.com");
	/* 두개의 MemberBean 객체를 ArrayList에 저장 */
	membersList.add(m1);
	membersList.add(m2);
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
			<td width="20%"><b>아이디</b></td>
			<td width="20%"><b>비밀번호</b></td>
			<td width="20%"><b>이름</b></td>
			<td width="20%"><b>이메일</b></td>
		</tr>	
		
		<!-- 인덱스가 0이므로 첫번째 회원정보 출력 -->
		<tr align="center">
			<td>${membersList[0].id }</td>
			<td>${membersList[0].pwd }</td>
			<td>${membersList[0].name }</td>
			<td>${membersList[0].email }</td>
		</tr>
		
		<!-- 인덱스가 1이므로 두번째 회원정보 출력 -->
		<tr align="center">
			<td>${membersList[1].id }</td>
			<td>${membersList[1].pwd }</td>
			<td>${membersList[1].name }</td>
			<td>${membersList[1].email }</td>
		</tr>			
	</table>		
</body>
</html>




























