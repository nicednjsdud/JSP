<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - forTokens </title>
</head>
<body>
	<%String rgba = "Red,Green,Blue,Black";%>
	
	<h4>JSTL forTokens 태그</h4>
	
	<!--구분된 토큰 개수 만큼 반복함 -->
	<c:forTokens items="<%=rgba %>" delims="," var="color">
		<span style="color: ${color};">${color }</span><br/>
	</c:forTokens>
	<br/>
	
	<c:set var="fruits" value="사과,파인애플,바나나,망고,귤"/>
	
	<c:forTokens items="${fruits }" delims="," var="token">
		${token }<br/>
	</c:forTokens>
</body>
</html>