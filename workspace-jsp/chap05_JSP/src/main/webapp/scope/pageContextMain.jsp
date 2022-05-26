<%@page import="kr.co.ezenac.dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// pageContext객체를 통해 page 영역에 숙성값을 저장함.
	pageContext.setAttribute("pageInteger", 1000);
	pageContext.setAttribute("pageString", "페이지 영역에 문자열");
	pageContext.setAttribute("pagePerson", new Person("이순신", 30));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 영역</title>
</head>
<body>
	<h2>page 영역의 속성값 읽기</h2>
	<%
		// 속성읽기
		int pInteger =(Integer) (pageContext.getAttribute("pageInteger"));
		String pString = pageContext.getAttribute("pageString").toString();
		Person pPerson = (Person)(pageContext.getAttribute("pagePerson"));
		
	%>
	<ul>
		<li>Integer 객체 : <%= pInteger %></li>
		<li>String 객체 : <%=pString %></li>
		<li>Person 객체 : <%=pPerson.getName() %>,<%=pPerson.getAge() %></li>
	</ul>
</body>
</html>