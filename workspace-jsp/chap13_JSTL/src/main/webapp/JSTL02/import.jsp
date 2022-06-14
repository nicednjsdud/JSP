<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - import </title>
</head>
<body>
	<c:set var="requestVar" value="BOBdev" scope="request" />
	<c:import url="/JSTL02/inc/otherPage.jsp" var="contents">	
		<c:param name="userParam1" value="JSP" />
		<c:param name="userParam2" value="Spring"/>
	</c:import>
	
	<h4>다른 문서 삽입하기</h4>
	${contents }
	
	<iframe src="inc/bobPage.jsp" style="width:100%; height: 600px;" />
</body>
</html>