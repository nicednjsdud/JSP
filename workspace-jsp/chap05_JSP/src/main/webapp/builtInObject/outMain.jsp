<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - out</title>
</head>
<body>
	<%
		out.print("텍스트 테스트입니다.");	// 버퍼에 저장
		out.clearBuffer();				// 버퍼를 비움(윗줄의 출력 결과 사라짐)
		
		out.print("<h2>out 내장 객체</h2>");
		
		// 버퍼 크기 정보 확인
		out.print("출력 버퍼의 크기 : "+out.getBufferSize()+"<br/>");// 현재 페이지에 설정된 버퍼의 크기
		out.print("남은 버퍼의 크기 : "+out.getRemaining()+"<br/>"); // 사용하고 남은 버퍼의 크기
		out.flush();	// 버퍼의 담긴 내용을 강제로 플러시함.
						// 원래는 모두 채워졌을 때 플러시되면서 내용이 출력함.
		out.print("flush후 버퍼의 크기 : "+out.getRemaining()+"<br/>"); //
	%>
</body>
</html>