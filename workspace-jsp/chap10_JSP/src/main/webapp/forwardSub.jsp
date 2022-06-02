<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - forward</title>
</head>
<body>
	<h2>포워드 결과</h2>
	<!-- 포워드 된 페이지는 이전 페이지와는 서로 다른 페이지임
		=> 페이지별 생성되는 page 영역은 공유되지 않음 
		 포워드 요청을 전달하므로 request 영역은 공유됨-->
	<ul>
		<li>
			page영역 : <%=pageContext.getAttribute("pAttr") %>
		</li>
		<li>
			request영역 : <%=request.getAttribute("rAttr") %>
		</li>
	</ul>
</body>
</html>