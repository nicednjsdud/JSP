<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!  
	String name = "이순신";
	public String getName() {return name;}
	public int add(int num1, int num2){
		return num1+num2;
	}
%>

<%
	String age = request.getParameter("age");
%>
<!DOCTYPE html>
<!-- HTML 주석 -->
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, init-scale=1.1">
<title>스크립트 요소</title>
</head>
<body>
	<% 
		int result = add(10,20); 
	// 자바 코드에 주석문
	%>
	덧셈 결과 1 : <%= result %><br>
	덧셈 결과 2 : <%= add(20,30) %>
	
	<br/>
	<br/>
	<h1>안녕하세요. <%=name %>님!</h1>
	<h1>나이는 <%= age %> 살 입니다!</h1>
	<h1>나이 + 10 <%= Integer.parseInt(age)+10 %>살입니다!</h1>
</body>
</html>