<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - param</title>
</head>
<body>
	<jsp:useBean id="person" class="kr.co.ezenac.bean.Person" scope="request" />
	<h2>포워드된 페이지에서 매개변수 확인</h2>
	<ul>
		<li><jsp:getProperty property="name" name="person"/> </li>
		<li>나이 : <%= request.getParameter("param1") %> </li>
		<li>나이 : <%= request.getParameter("param2") %> </li>
		<li>나이 : <%= request.getParameter("param3") %> </li>
	</ul>
</body>
</html>