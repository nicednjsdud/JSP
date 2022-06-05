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
	<!-- include한 jsp페이지와는 변수를 직접 공유 불가 -->
	<jsp:include page="inc/paramInclude.jsp"  >
		<jsp:param value="경기도 양평군" name="Loc1"/>
		<jsp:param value="용문면" name="Loc2"/>
	</jsp:include>
	<!-- jsp:param include한 페이지로도 매개변수 전달 가능 -->
</body>
</html>