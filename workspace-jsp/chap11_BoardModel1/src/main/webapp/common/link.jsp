<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<%-- 로그인 여부에 따른 메뉴 변화 --%> <%
 if (session.getAttribute("UserId") == null) { // 로그인 정보가 없다면
 %> <a href="../session/loginForm.jsp">로그인</a> <%
 } else {
 %> <a href="../session/logout.jsp" >로그아웃</a> <%
 }
 %> &nbsp;&nbsp;&nbsp; <a href="../board/list.jsp">게시판(페이징 X)</a>
			</td>
		</tr>
	</table>
</body>
</html>