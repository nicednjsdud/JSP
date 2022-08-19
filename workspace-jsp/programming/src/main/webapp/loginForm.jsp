<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function validateForm(form){
	if(form.userId.value!=form.userPwd.value){
		alert("로그인 실패");
		form.userId.focus();
		return false;
	}
}
</script>
<style>
#loginFrm{
	text-align:center;
	border:1px solid black;
	margin:auto;
	height:100px;
	width: 30%;
	margin-top:20px;
	
}
h1{
	margin:auto;
	text-align:center;
	margin-top:200px;
}


</style>
</head>
<body>
	<h1>로그인 폼</h1>
	<form action="loginPro.jsp" method="post" id="loginFrm" onsubmit="return validateForm(this)" >
		<table id="tb" align="center">
		
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" id="userId" name="userId"/>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="userPwd" name="userPwd" /></td>
			</tr>
			
		
		</table>
			<input type="submit" name="submit" value="로그인" />
	</form>
</body>
</html>