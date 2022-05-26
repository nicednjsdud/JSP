<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, init-scale=1.1">
<title>page 지시어 - errorPage</title>
</head>
<body>
	<%	// 500 에러
		int myAge = Integer.parseInt(request.getParameter("age")) + 10;
		out.println("10년 후 나이는 "+myAge+"입니다.");
	%>
</body>
</html>