<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>  

<jsp:useBean id="m" class="kr.co.ezeanac.el.MemberBean" />   
<jsp:setProperty property="*" name="m"/> 

<jsp:useBean id="addr" class="kr.co.ezeanac.el.Address" />
	<!-- Address빈을 생성한후 도시와 우편번호를 설정 -->
<jsp:setProperty property="city" name="addr" value="서울"/>
<jsp:setProperty property="zipcode" name="addr" value="06611"/>

	<!-- MemberBean의 addr 속성에 Address빈을 설정 -->
<%
	m.setAddr(addr);
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
			<td width="20%"><b>도시</b></td>
			<td width="20%"><b>우편번호</b></td>
		</tr>
<%-- 		
		<tr align="center">
			<td>${m.id }</td>
			<td>${m.pwd }</td>
			<td>${m.name }</td>
			<td>${m.email }</td>
			<td><%=m.getAddr().getCity() %></td>
			<td><%=m.getAddr().getZipcode() %></td>
		</tr>
 --%>	
 		<!-- 자바빈의 속성이름과 .연산자를 이용해 주소 출력 -->
		<tr align="center">
			<td>${m.id }</td>
			<td>${m.pwd }</td>
			<td>${m.name }</td>
			<td>${m.email }</td>
			<td>${m.addr.city }</td>
			<td>${m.addr.zipcode }</td>
		</tr>		
	</table>		
</body>
</html>















