<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forEach (향상된 for문)</title>
</head>
<body>
	<h4>향상된 for문 형태의 forEach 태그</h4>
	<%
		String[] rgba = {"Red","Green","Blue","Black"};
	%>
	<c:forEach items="<%=rgba %>" var="c">
		<span style="color:${c}" >${c }</span>
	</c:forEach>
	<h4> varStatus 속성</h4>
	<table border="1">
		<c:forEach items="<%=rgba %>" var="c" varStatus="bob">
			<tr>
				<td>count : ${bob.count }</td>
				<td>index : ${bob.index }</td>
				<td>current : ${bob.current }</td>
				<td>first : ${bob.first }</td>
				<td>last : ${bob.last }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>