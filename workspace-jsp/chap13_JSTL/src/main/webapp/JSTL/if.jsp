<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="id" value="bob" scope="page" />
<c:set var="name" value="${'정원영' }" />
<c:set var="number" value="100"/>
<c:set var="string" value="100"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - if</title>
</head>
<body>
	<c:if test="${true }">	<!-- 조건식이 true이므로 항상 참임 -->
		<h4>항상 참입니다.</h4>
	</c:if>
	
	<c:if test=" ${true } " var="result">
		<h4>EL 양쪽에 빈 공백이 있는 경우 </h4>
	</c:if>
	result : ${result }<br/>
	
	<c:if test="${13==13 }" >	<!-- 조건식에 비교 연산자를 사용 -->
		<h4>두 값은 같습니다.</h4>
	</c:if>
	
	<c:if test="${13 !=13 }">
		<h4>두 값은 같지 않습니다.</h4>
	</c:if>
	
	<c:if test="${(id=='bob') && (name=='정원영')}">
		<h4> 아이디는 ${id } 이름은 ${name }입니다.</h4>
	</c:if>
	
	<h4>JSTL의 if 태그로 짝수/홀수 판단하기</h4>
	<c:if test="${number mod 2 eq 0 }" var="result">
		<h4>${number }는 짝수 입니다.</h4>
	</c:if>
	result : ${result }<br>
	
	<h4>문자열 비교와 else 구문처럼 사용하기 </h4>
	<c:if test="${string eq 'Java' }" var="result2">
		출력되지 않음 <br>
	</c:if>
	<c:if test="${not result2 }">
		'Java'와 string은 같지 않습니다.<br>
	</c:if>
	
	<h4>조건식 주의사항</h4>
	<c:if test="bob" var="result3">
		EL이 아닌 일반 값이 오면 무조건 false를 반환함
	</c:if>
	result3 : ${result3 } <br>
	
	<c:if test="true" var="result4">
		EL이 아닌 일반 값으로 true가 사용되는 것은 예외임<br>
	</c:if>
	result4 : ${result4 } <br>
</body>
</html>