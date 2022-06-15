<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js" ></script>
<script type="text/javascript">
	function fnProcess() {
		let value = $("#textInput").val()/* id로 텍스트 박스 접근하여 val()이용해서 입력값 가져옴*/
		$("#textOutput").val(value) /* id로 텍스트 박스 접근하여 val()이용해서 값을 출력함*/
	}
</script>
<title>텍스트에 박스 표시</title>
</head>
<body>
	<input type="text" id="textInput" />
	<input type="button" value="입력하기" onclick="fnProcess()" /><br><br>
	결과 : <br>
	<input type="text" id="textOutput" disabled /> 
</body>
</html>