<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js" ></script>
<script type="text/javascript">
	$(function() {
		$("#checkJson").click(function() {
							/* 회원정보 */
			let jsonStr = '{"name":"정원영","age":26,"gender":"남자","nickname":"BOB"}'
			let jsonInfo = JSON.parse(jsonStr)				/* JSON 자료형을 리턴 */
			
			let output="회원 정보<br>"
			output += "===============<br>"
			output += "이름: " +jsonInfo.name+"<br>" /* 문자열에서 JSON객체 속성 가져옴 */
			output += "나이: " +jsonInfo.age+"<br>"
			output += "성별: " +jsonInfo.gender+"<br>"
			output += "별명: " +jsonInfo.nickname+"<br>"
			
			$("#output").html(output) /* 회원이름 출력 */
		})
	})
</script>
<title>JSON 테스트</title>
</head>
<body>
	<a id="checkJson" style="cursor: pointer;">출력</a><br><br>
	<div id="output"></div>
</body>
</html>