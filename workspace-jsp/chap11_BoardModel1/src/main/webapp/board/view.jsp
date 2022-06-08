<%@page import="kr.co.ezenac.model1.board.dto.BoardDTO"%>
<%@page import="kr.co.ezenac.model1.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO(application);
	dao.updateVisitCount(num);		// 조회수 증가
	BoardDTO dto = dao.selectView(num);	// 게시물 가죠오기
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
</head>
<body>
	<jsp:include page="../common/link.jsp" />
	<h2>게시판 - 상세보기</h2>
	<form action="#" name="writeFrm">
		<input type="hidden" name="num" value="<%= num %>" />
		
		<table border="1" width="90%">
			<tr>
				<td>번호</td>
				<td><%= dto.getNum() %></td>
				<td>작성자</td>
				<td><%= dto.getName() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%= dto.getPostdate() %></td>
				<td>조회수</td>
				<td><%= dto.getVisitcount() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3" height="100"><%= dto.getTitle() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3" height="100"><%= dto.getContent().replace("\r\n", "<br>") %></td>
			</tr>
			<tr>
				<td colspan="4" align="center" >
					<%
						/* 로그인한 사용자와 작성가 같을때만 표시 */
						if (session.getAttribute("UserId") !=null && session.getAttribute("UserId").toString().equals(dto.getId())){
							%> 
								<button type="button" onclick="location.href='edit.jsp?num=<%=dto.getNum() %>'" >수정하기</button>
								<button type="button" onclick="" >삭제하기</button>
							<% 
						}
					%>
						<button type="button" onclick="location.href='list.jsp'">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>







