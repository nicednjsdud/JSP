<%@page import="java.util.HashMap"%>
<%@page import="kr.co.ezenac.jstl.Person"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.ezenac.jstl.MemberBean"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");  %>
<%
	List<MemberBean> membersList = new ArrayList<>();
	MemberBean m1 = new MemberBean("bob","0824","원영","nicednjsdud@gmail.com");
	MemberBean m2 = new MemberBean("bob2","0824","원영2","nicednjsdud2@gmail.com");
	MemberBean m3 = new MemberBean("bob3","0824","원영3","nicednjsdud3@gmail.com");
	membersList.add(m1);
	membersList.add(m2);
	membersList.add(m3);
%>
<c:set var="membersList" value="<%= membersList %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반복문</title>
</head>
<body>
	<table border="1" aling="center">
		<tr align="center" bgcolor="#99ccff">
			<td width="7%"><b>아이디</b></td>
			<td width="7%"><b>비밀번호</b></td>
			<td width="7%"><b>이름</b></td>
			<td width="7%"><b>이메일</b></td>
		</tr>
		<c:forEach var="i" begin="0" end="2" step="1">
			<tr align = "center">
				<td>${membersList[i].id }</td>
				<td>${membersList[i].pwd }</td>
				<td>${membersList[i].name }</td>
				<td>${membersList[i].email }</td>
			</tr>
		</c:forEach>
		
		<c:forEach items="<%= membersList %>" var="j">
			<tr align ="center">
				<td>${j.id }</td>
				<td>${j.pwd }</td>
				<td>${j.name }</td>
				<td>${j.email }</td>
			</tr>
		</c:forEach>
	</table>
	
	<h4>Map 컬렉션 사용</h4>
	<%
		Map<String,Person> maps = new HashMap<>();
		maps.put("1st",new Person("정원영",34));
		maps.put("2nd",new Person("밥",26));
		maps.put("3rd",new Person("개발자 밥",26));
	%>
	<c:set var="maps" value="<%=maps %>" />
	
	
	<c:forEach var="map" items="${maps }">
			<li>
				Key => ${map.key }<br/>
				Value => 이름 : ${map.value.name } 나이 : ${map.value.age }
			</li>
	</c:forEach>
</body>
</html>









