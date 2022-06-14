<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>표현 언어(EL) - 내장 객체</title>
</head>
<body>
	<h2>각 영역에 저장된 속성 읽기(EL 내장 객체 사용)- 포워된 페이지</h2>
	<ul>
		<!-- 내장 객체의 영역 중 page 영역은 포워드되면 소멸되고 새로 만들어짐 -->
		<li>페이지 영역(EL) : ${pageScope.scopeValue }</li>
		<li>리퀘스트 영역(EL) : ${requestScope.scopeValue }</li>
		<li>세션 영역(EL) : ${sessionScope.scopeValue }</li>
		<li>애플리케이션 영역(EL) : ${applicationScope.scopeValue }</li>
		<li></li>
	</ul>
	
	<h2>영역 지정없이 속성 읽기</h2>
	<ul>
		<!-- 영역을 따로 지정하지 않으면 가장 좁은 영역에서부터 속성을 찾음 -->
		<li>${scopeValue }</li>
	</ul>	
</body>
</html>




