<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
	<h2>액션 태그로 폼값 한 번에 받기</h2>
	<form method="post" action="useBeanAction.jsp">
		이름 : <input type="text" name="name" /><br>
		나이 : <input type="text" name="age" />
		<input type="submit" value="폼값 전송" />
	</form>
</body>
</html>