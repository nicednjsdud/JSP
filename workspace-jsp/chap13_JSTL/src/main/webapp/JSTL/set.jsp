<%@page import="kr.co.ezenac.jstl.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   <!-- 태그라이브러리 URI 식별자 --> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>JSTL - set</title>
</head>
<body>
	<!-- 변수 선언 -->
	<c:set var="directVar" value="100" />
	<c:set var="elVar" value="${ directVar mod 5 }" />
	<c:set var="expVar" value="<%= new Date() %>" />
	<c:set var="betweenVar">변수값 설정</c:set>
	<h4>EL 이용해 변수 출력</h4>
	<ul>
		<li>directVar : ${pageScope.directVar }</li>
		<li>elVar : ${elVar }</li>
		<li>expVar : ${expVar }</li>
		<li>betweenVar : ${betweenVar }</li>
	</ul>	
	
	<h4>자바빈즈 생성 - 생성자 사용</h4>
	<!-- 자바빈즈도 변수로 선언가능, 자바빈즈 생성시 생성자를 통해 초기값 설정 -->
	<!--  request영역에 저장된 자비빈즈 출력함 -->
	<c:set  var="personVar" value='<%= new Person("이순신",40) %>' scope="request"/>
	<ul>
		<li>이름 : ${requestScope.personVar.name }</li>
		<li>나이 : ${personVar.age }</li>
		
	<h4>자바빈즈 생성2 - target, property 사용</h4>
	<c:set var="personVar2" value="<%= new Person() %>" scope="request" />
	<c:set target="${personVar2 }" property="name" value="이방원" />
	<c:set target="${personVar2}" property="age" value="30" />
	<ul>
		<li>이름 : ${personVar2.name }</li>
		<li>나이 : ${requestScope.personVar2.age }</li>
	</ul>
	</ul>
</body>
</html>