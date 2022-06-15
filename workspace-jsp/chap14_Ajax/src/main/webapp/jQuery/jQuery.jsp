<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {		/* document에 DOM이 로드되는 이벤트처리 함수 */
		alert($("#unique").html())		
		/* 페이지 로드 시 id가 unique인 태그를 검색한후 html() 이용해 태그값을 뿌려줌*/
	})
</script>
<title>ID 선택자</title>
</head>
<body>
	<div class="class1">안녕하세요.</div>
	<div id="unique">제이쿼리입니다!</div>
</body>
</html>