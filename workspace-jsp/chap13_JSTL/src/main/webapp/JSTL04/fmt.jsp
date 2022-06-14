<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - fmt</title>
</head>
<body>
	<h4>숫자 포맷</h4>
	<c:set var="number1" value="12345" /> <!-- 숫자를 값으로 갖는 변수 선언 -->
	<fmt:formatNumber value="${number1 }"  /><br><br>
	<%-- 기본적으로 큰수는 세자리마다 콤마출력 --%>
	
	<fmt:formatNumber value="${number1 }" groupingUsed="false" />
	<br><br>
	<%-- var 속성 사용으로 즉시 출력하지 않고 지정한 위치에 출력함 --%>
	<fmt:formatNumber value="${number1 }" type="currency" var="printNumber1"/>
	통화기호 : ${printNumber1 } 
	<br><br>
	<fmt:formatNumber value="0.03" type="percent" var="printNumber2"/>
	퍼센트 : ${printNumber2 }
</body>
</html>