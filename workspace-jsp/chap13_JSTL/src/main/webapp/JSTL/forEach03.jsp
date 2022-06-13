<%@page import="kr.co.ezenac.jstl.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach(향상된 for문 - collection)</title>
</head>
<body>
	<h4>List 컬렉션 사용</h4>
	<%
		LinkedList<Person> lists = new LinkedList<>();
		lists.add(new Person("밥",26));
		lists.add(new Person("Developer BOB",30));
	%>
	
	<c:set var="lists" value="<%= lists %>" />
	<c:forEach items="${lists }" var="list">
		<li>
			이름 : ${list.name } 나이 : ${list.age }
		</li>
	</c:forEach>
</body>
</html>