<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js" ></script>
<script type="text/javascript">
	$(function() {
		$("#checkJson").click(function() {
			/* 전송할 회원정보를 JSON 형식으로 만듬*/
			let _jsonInfo = '{"name":"정원영","age":26,"gender":"남자","nickname":"BOB"}'
			$.ajax({
				type: "post",
				url: "${contextPath}/json",
				data: {jsonInfo: _jsonInfo}, 
				/* 매개변수 이름 jsonInfo로 JSON데이터를 ajax로 전송*/
				success: function(data,textStatus) {},
				error: function(data,textStatus) {alert("에러가 발생했습니다.")},
				complete: function(data,textStatus) {alert("작업을 완료했습니다.")}
			})
		})
	})
</script>
<title>JSON ajax 테스트</title>
</head>
<body>
	<a id="checkJson" style="cursor: pointer;">전송</a><br><br>
	<div id="output"></div>
</body>
</html>