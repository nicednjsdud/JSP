<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("user_id");
		String userPw = request.getParameter("user_pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, init-scale=1.1">
<title>결과출력2</title>
</head>
<body>
	<%
		if(userId ==null || userId.length()==0){	// ID가 정상적으로 입력되었는지 체크%>
			아이디를 입력하세요 <br/>
	<% 	
		}
	%>
</body>
</html>