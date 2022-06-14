<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- pageContext 내장 객체의 컨텍스트 이름을 변수 contextPath에 미리 설정함 -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="member3.jsp">
		아이디 : <input type="text" size="20" /><br>
		비밀번호 : <input type="password" size="20" /><br>
		<input type="submit" value="로그인" />
		<input type="reset" value="다시입력" /><br><br>		
	</form>
	<!-- 긴 내장 객체의 속성을 사용할 필요 없이 간단한 변수이름으로 컨텍스트 이름을 설정함 -->
 	<a href="${contextPath }/JSTL/memberForm.jsp">회원가입 하기</a>
</body>
</html>