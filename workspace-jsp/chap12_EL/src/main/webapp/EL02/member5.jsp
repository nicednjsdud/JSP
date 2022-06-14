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
	<!-- 회원 정보를 저장할 HashMap 객체를 액션태그 이용해 생성 -->
<jsp:useBean id="membersMap" class="java.util.HashMap" />

<%
	/* HashMap에 key/value 쌍으로 회원정보 저장 */
	membersMap.put("id", "ezenac6");
	membersMap.put("pwd", "0824");
	membersMap.put("name", "이젠6");
	membersMap.put("email", "ezenac6@gmail.com");
	
	/* 회원정보 저장하는 MemberBean 객체 생성 */
	MemberBean m2 = new MemberBean("ezenac7","0824","이젠7", "ezenac7@gmail.com");
	
	/* 전송된 회원정보(m1)와 자바코드로 생성한 회원정보(m2)를 ArrayList에 저장 */
	membersList.add(m1);
	membersList.add(m2);
	
	/* 회원정보가 저장된 membersList를 membersList라는 key로 HashMap에 저장 */
	membersMap.put("membersList", membersList);
	
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
		
	<!-- HashMap이름 뒤에 .연산자로 저장시 사용한 key를 사용하여 value를 가져옴 -->		
	<tr align="center">
		<td>${membersMap.id }</td>
		<td>${membersMap.pwd }</td>
		<td>${membersMap.name }</td>
		<td>${membersMap.email }</td>
	</tr>
	
	<!-- HashMap에 저장된 ArrayList에 .연산자로 접근한 후 다시 각각의 속성에 .를 이용해 접근하여 첫번째 회원정보 출력 -->
	<tr align="center">
		<td>${membersMap.membersList[0].id }</td>
		<td>${membersMap.membersList[0].pwd }</td>
		<td>${membersMap.membersList[0].name }</td>
		<td>${membersMap.membersList[0].email }</td>
	</tr>
	
	<tr align="center">
		<td>${membersMap.membersList[1].id }</td>
		<td>${membersMap.membersList[1].pwd }</td>
		<td>${membersMap.membersList[1].name }</td>
		<td>${membersMap.membersList[1].email }</td>	
	</tr>		
	</table>		
</body>
</html>











