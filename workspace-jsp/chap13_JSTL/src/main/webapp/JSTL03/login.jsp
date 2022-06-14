<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<form action="result2.jsp" method="post">
		아이디 : <input type="text" name="userId" /><br>
		비밀번호 : <input type="password" name ="userPw"/><br>
		<input type="submit" value="로그인하기"/>
		<input type="reset" value="다시입력"/><br><br>
	</form>
</body>
</html>