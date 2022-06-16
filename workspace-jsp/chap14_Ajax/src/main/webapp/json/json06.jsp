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
			$.ajax({
				type: "post",
				url: "${contextpath}/json3",
				/* 매개변수 이름 jsonInfo로 JSON데이터를 ajax로 전송*/
				success: function(data,textStatus) {
					let jsonInfo=JSON.parse(data) 
					/* 서버에서 전송한 JSON 데이터를 파싱함*/
					
					let output="회원 정보<br>"
						output += "===============<br>"
						for(let i in jsonInfo.members){
							/* 문자열에서 JSON객체 속성 가져옴 */
						output += "이름: " +jsonInfo.members[i].name+"<br>" 
						output += "나이: " +jsonInfo.members[i].age+"<br>"
						output += "성별: " +jsonInfo.members[i].gender+"<br>"
						output += "별명: " +jsonInfo.members[i].nickname+"<br><br>"

						}
						$("#output").html(output) 
				},
				error: function(data,textStatus) {alert("에러가 발생했습니다.")},
				complete: function(data,textStatus) {alert("작업을 완료했습니다.")}
			})
		})
	})
</script>
<title>JSON ajax 테스트</title>
</head>
<body>
	<a id="checkJson" style="cursor: pointer;">회원 정보 수신하기</a><br><br>
	<div id="output"></div>
</body>
</html>