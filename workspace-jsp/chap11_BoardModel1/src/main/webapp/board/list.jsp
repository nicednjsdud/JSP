<%@page import="kr.co.ezenac.model1.board.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.co.ezenac.model1.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//DAO 객체 생성해 DB 연결
BoardDAO dao = new BoardDAO(application);

// 사용자가 입력한 검색 조건은 Map에 저장
Map<String, Object> param = new HashMap<>();
String searchField = request.getParameter("searchField");	// 검색어 폼값 받기
String searchWord = request.getParameter("searchWord");

if(searchWord !=null){		// 검색어가 있을때 Map에 저장
	param.put("searchField",searchField);
	param.put("searchWord",searchWord);
}

int totalCount = dao.selectCount(param);	//게시물 수 확인
List<BoardDTO> boardLists = dao.selectList(param);	// 게시물 목록 받기

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록보기</title>
</head>
<body>
	<jsp:include page="../common/link.jsp" />
	<h2>목록 보기</h2>
	<!--  검색 폼 -->
	<form action="#" method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center">
					<select name="searchField">
							<option value="title">제목</option>
							<option value="content">내용</option>
					</select> 
					<input type="text" name="searchWord" /> 
					<input type="submit" value="검색하기" />
				</td>
			</tr>
		</table>

		<!--게시물 목록 테이블 -->
		<table>
			
		</table>
		<!-- 게시물 목록 테이블 -->
		<table border="1" width=90%>
			<!-- 컬럼이름 -->
			<tr>
				<th width="10%">번호</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="10%">조회수</th>
				<th width="15%">작성일</th>
			</tr>
			<!-- 목록내용 -->
			<%
				if(boardLists.isEmpty()){
					// 게시물이 하나도 없는 경우
			%>
				<tr>
					<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
				</tr>
			<%	
				}
				else{ // 입력된 게시물이 있다면
					int virtalNum = 0;	// 화면상의 게시물 번호 (가상번호)
					for(BoardDTO dto: boardLists){
						virtalNum=totalCount--;	// 전체 게시물 수에서 시작해 1개씩 감소
			%>
					<tr align="center">
						<td><%=virtalNum %></td> <!--  게시물 번호 -->
						<td align="left">	<!--  제목 클릭시 일련번호를 통해 상세보기 페이지로 이동 -->
							<a href="view.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a>
						</td>
						<td align="center"><%=dto.getId() %></td> <!-- 작성자 id -->
						<td align="center"><%=dto.getVisitcount() %></td>
						<td align="center"><%=dto.getPostdate() %></td>
					</tr>
			<%
					}
				}
			%>
		</table>
		
		<!--  글쓰기 버튼 -->
		<table border="1" width="90%">
			<tr align="right">
				<td>
					<button type="button" onClick="location.href='write.jsp'">글쓰기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>







