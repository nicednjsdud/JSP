<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js" ></script>
<script type="text/javascript">
	function addImage() {
		/* 버튼클릭시 클래스이름이 class1인 태그를 찾아서 <img>태그를 추가함*/
		$(".class1").html("<img src='../image/image.jpg' />")
	}
</script>
<title>class 선택자</title>
</head>
<body>
	<div class="class1"></div>
	<div class="class1"></div>
	<input type="button" value="이미지 추가하기" onclick="addImage()" />
</body>
</html>