<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 리스트</title>
<style>
header{
	text-align:center;
}
.bookNav{
	width: 80%;
	margin : auto;
	display:flex;
	flex-decoration:row;
	margin-bottom: 50px;
}
.NavList{
	margin-right: 30px;
	font-size: 1.5em;
}
a{
	text-decoration:none;
	color:black;
}
a:active{
	color:black;
}
.search{
	margin-top:30px;
	margin:auto;
}
.listMain{
	margin:auto;
}
.pagingList{
	padding-top:20px;
	margin:auto;
}
footer{
	margin-top:50px;
	text-size : 3em;
	text-align:center;
	font-weight:bold;
}
</style>
</head>
<body margin="auto">
	<header>
		<h1>Book List</h1>
	</header>
	<nav>
		<div class= "bookNav">
			<div class="NavList"><a href="../book/BookInsert.jsp">도서입력</a></div>
			<div class="NavList"><a href="../book/listBook.do">도서목록 화면</a></div>
		</div>
	</nav>
	<section>
	<form action="#" method="get">
		
		
		<!-- 게시물 목록 테이블 -->
		<table class="listMain" border="1" width=90%>
			<!-- 컬럼이름 -->
			<tr>
				<th width="10%">도서코드</th>
				<th width="40%">도서명</th>
				<th width="15%">저자</th>
				<th width="10%">출판사</th>
				<th width="15%">가격</th>
				<th width="15%">출판일</th>
			</tr>
			<c:choose>
				<c:when test="${empty bookLists }" > <!-- 게시물이 없을 때 -->
				<tr>
					<td colspan="5" align="center">
						등록된 게시물이 없습니다.
					</td>
				</tr>
				</c:when>
				<c:otherwise>		<!-- 게시물이 있을 때 -->
					<c:forEach items="${bookLists }" var="row" varStatus="loop">
						<tr align="center">
							<td>	
								 ${map.totalCount - (((map.pageNum-1)* map.pageSize)+loop.index)}
							</td>
							<td>${row.bookName }</td>
							<td>${row.author }</td>
							<td>${row.publisher }</td>
							<td>${row.price }</td>
							<td>${row.publicationDate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
			
			<!-- 하단메뉴 (페이징,글쓰기)  -->
		<table class="pagingList" width="90%" >
				<tr align="center">
					<td>${map.pagingImag}</td>
					<td width="100">
						<button type="button" onclick="location.href='../book/BookInsert.jsp';">글쓰기</button>
					</td>
				</tr>
				
		</table>
		<table class="search" width="90%">
			<tr>
				<td align="center">
					<select name="searchField">
							<option value="title">제목</option>
							<option value="content">내용</option>
					</select> 
					<input type="text" size="20" name="searchWord" /> 
					<input type="submit" value="검색하기" />
				</td>
			</tr>
		</table>
	</form>
	</section>
	<footer>
		<div>
			작성자 : 정 원 영
		</div>
	</footer>
</body>
</html>