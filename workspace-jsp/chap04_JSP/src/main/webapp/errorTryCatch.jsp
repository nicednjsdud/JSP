<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="isErrorPage.jsp"%>
    	<!--  페이지에서 에러가 발생하면 직접 처리하지 않고 
    	errorPage 속성으로 지정한 페이지를 웹브라우저에 출력함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width=device-width, init-scale=1.1">
<title>page 지시어 - errorPage</title>
</head>
<body>
	<%
//		try {
			int myAge = Integer.parseInt(request.getParameter("age")) + 10;
			out.println("10년 후 나이는 "+myAge+"입니다.");
//		}catch(Exception e){
//			out.println("예외 발생 : 매개변수 age가 null입니다.");
//		}
	%>
</body>
</html>