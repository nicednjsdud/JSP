<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("num1", 4);
	pageContext.setAttribute("num2", "5");
	pageContext.setAttribute("num3", "8");
%>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>표현 언어의 산술 연산자</title>
</head>
<body>
	<h2>여러가지 산술연산자</h2>
	<h1>
		${100/9 } <br/>
		${100 div 9 }<br/>
		${100 % 9 }<br/>
		${100 mod 9 }<br/>
	</h1>
	
	<h2>여러가지 비교연산자</h2>
	<h3>
		${10 == 10 }<br/>
		${10 eq 10 }<br/>
		${"Seoul" == "Seoul" }<br/>
		${"Seoul" eq "Seoul" }<br/>
		num3 > num2 : ${num3 gt num2  }<br/>
		num1 < num3 : ${num1 lt num3  }<br/>
		
		${"hello" != "apple" }<br/>
		${"hello" ne "apple" }<br/>
	</h3>
	
	<h2>여러가지 논리연산자</h2>
	<h3>
		${(10==10)&&(20==20) }<br/>
		${(10==10)and(20!=20) }<br/>
		
		${(10==10)||(20==30) }<br/>
		${(10!=10)or(20!=20) }<br/>		
		
		${!(20==10)}<br/>		
		${not(20==10)}<br/>
			
	</h3>

	
</body>
</html>













