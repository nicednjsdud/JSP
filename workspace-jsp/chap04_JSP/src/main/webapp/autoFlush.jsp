<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="8kb" autoFlush="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, init-scale=1.1">
<title>page 지시어 - buffer autoFlush</title>
</head>
<body>
	<%
		for(int i=1;i<=100;i++){
			out.print("abcdefgh12345");
		}
	%>
</body>
</html>