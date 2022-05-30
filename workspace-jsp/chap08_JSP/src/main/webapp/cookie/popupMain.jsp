<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String popupMode = "on"; %> <!--  popupMode: 레이어 팝업창을 띄울지를 알려주는 변수 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리</title>
<style type="text/css">
	div#popup {
		position : absolute;
		top: 100px;
		left: 50px;
		color: yellow;
		width: 270px;
		height: 100px;
		background-color: gray;
	}
	div#popup>div {
		position:relative;
		background-color: #ffffff;
		top: 0px;
		border: 1px solid gray;
		padding: 10px;
		color: black;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function popBtn() {
		$('#closeBtn').click(function () {	/* 닫기 버튼을 누르면 */
			$('#popup').hide()		/* 팝업창을 숨김 처리함 */
		})
	})
</script>

</head>
<body>
	<h2>팝업 메인 페이지</h2>
	<%
		for(int i=1;i<=10;i++){
			out.print("현재 팝업창은 "+popupMode+" 상태입니다.<br/>");
		}
		if (popupMode.equals("on")){		/* 팝업 창 표시 */
	%>
		<div id="popup">
			<h2 align="center">공지사항 팝업입니다.</h2>
			<div align="right">
				<form action="#" name="popFrm">
					<input type="checkbox" id="inactiveToday" value="1" />오늘 하루 열지 않음
					<input type="button" value="닫기" id="closeBtn"  /> 
				</form>
			</div>
		</div>	
	<% 
		}
	%>
</body>
</html>