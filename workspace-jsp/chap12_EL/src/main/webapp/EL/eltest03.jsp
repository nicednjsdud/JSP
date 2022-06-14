<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="m1" class="kr.co.ezeanac.el.MemberBean" scope="page" />    <!-- 유즈빈 생성 -->
<jsp:setProperty property="name" name="m1" value="이순신"/>	<!-- 빈의 name속성에 값을 설정함  -->
<jsp:useBean id="m2" class="java.util.ArrayList" scope="page" /> 	<!-- ArrayList 객체를 빈으로 생성 -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>표현 언어의 연산자들</title>
</head>
<body>
	empty 연산자
	<h2>
		${empty m1 }<br /> 			<!-- m1의 name 속성에 값이 설정되어 있으므로 false 반환함 -->
		${not empty m1 }<br /><br />
		
		${empty m2 }<br /> 			<!-- ArrayList 객체의 m2는 비어있음 -->
		
		${empty "Hello" }<br /> 
		${empty null }<br /> 
		${empty "" }
		
		
	</h2>

</body>
</html>











