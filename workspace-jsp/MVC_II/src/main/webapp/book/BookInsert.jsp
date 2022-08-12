<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function validateForm(form) {		
		if(form.bookID.value==""){
			alert("도서코드를 입력하세요.");
			form.bookID.focus();
			return false;
		}
		if(form.bookName.value==""){
			alert("도서명을 입력하세요.");
			form.bookName.focus();
			return false;
		}
		if(form.author.value==""){
			alert("저자를 입력하세요.");
			form.author.focus();
			return false;
		}	
	}
	
</script>
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
#insert_tb{
	margin:auto;
	border:1px solid black;
	width:30%;
}
.essential{
	text-weight:bold;
	color:red;
	width:50%;
}
footer{
	margin-top:50px;
	text-size : 3em;
	text-align:center;
	font-weight:bold;
}


</style>
<title>파일 첨부형 게시판</title>
</head>
<body>
	<header>
		<h1>Book Insert</h1>
	</header>
	<nav>
		<div class= "bookNav">
			<div class="NavList"><a href="../book/BookInsert.jsp">도서입력</a></div>
			<div class="NavList"><a href="../book/bookList.do">도서목록 화면</a></div>
		</div>
	</nav>
	<section>
	<form action="../book/insert.do" name="writeFrm" method="post" onsubmit="return validateForm(this)">
		<table id="insert_tb" border="1">
			<tr>
				<td class="essential">도서코드(숫자로만 입력,필수) </td>
				<td><input type="text" name="bookID" /></td>
			</tr>
			<tr>
				<td class="essential">도서명 (필수) </td>
				<td><input type="text" name="bookName"  /></td>
			</tr>
			<tr>
				<td class="essential">저자 (필수)</td>
				<td><input type="text" name="author"  />
				</td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher"/></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price"/></td>
			</tr>
			<tr>
				<td>출판일</td>
				<td><input type="text" name="publicationDate"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성 완료</button>
					<button type="reset">다시 입력</button>
					<button type="button" onclick="location.href='../book/bookList.do'">목록
						보기</button>
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