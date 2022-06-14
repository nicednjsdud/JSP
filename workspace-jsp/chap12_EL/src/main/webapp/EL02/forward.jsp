<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	/* request에 주소 정보 바인딩 */
	request.setAttribute("address", "서울시 서초구 서초대로77길 54");
%>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>requestScope 사용</title>
</head>
<body>
	<jsp:forward page="member2.jsp" />
</body>
</html>