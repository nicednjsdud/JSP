<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹소켓 채팅창</title>
<style type="text/css">
#chatWindow {
	border: 1px solid black;
	width: 280px;
	height: 280px;
	overflow: scroll;
	padding: 5px;
}

#chatMessage {
	width: 240px;
	height: 30px;
}

#sendBtn {
	height: 30px;
	position: relative;
	top: 2px;
	left: -2px;
}

#closeBtn {
	margin-bottom: 3px;
	position: relative;
	top: 2px;
	left: -2px;
}

.myMsg {
	text-align: right;
}
</style>
</head>
<body>
	<!-- 대화창 UI -->
	대화명 : <input type="text" id="chatId" value="${param.chatId }" readonly />
	<button id="closeBtn" onclick="disconnect()">채팅 종료</button>
	<div id="chatWindow"></div>
    <div>
        <input type="text" id="chatMessage" onkeyup="enterKey()" />
        <button id="sendBtn" onclick="sendMessage()">전송</button>
    </div>	
	<script type="text/javascript">
		let webSocket = new WebSocket("<%=application.getInitParameter("CHARSERVER_ADDR") %>/ChatingServer")
		
		
		let chatWindow, chatMessage, chatId;
		// 채팅창이 열리면 대화창, 메세지 입력창, 대화명 표시란으로 DOM 객체 저장 
		  window.onload = function () {
          chatWindow = document.getElementById("chatWindow")
          chatMessage = document.getElementById("chatMessage")
          chatId = document.getElementById("chatId").value          
      }	 
		
		function sendMessage() {
			// 대화창에 표시
			chatWindow.innerHTML += "<div class='myMsg'>" +chatMessage.value+ "<div>"
			// 서버로 전송
			webSocket.send(chatId + '|' + chatMessage.value);
			// 메세지 입력창 내용 지우기
			chatMessage.value = "";
			chatWindow.screenTop= chatWindow.scrollHeight;
		}
		
		// 서버 연결 종료
		function disconnect(){
			webSocket.close();
		}
		/*
			웹 소켓과 관련된 이벤트가 발생시 호출되는 함수들 정의 
			- 각 상황은 이벤트로 전달됨 => 리스너가 감지하여 이 메서드를 호출해줄것임
		*/
		
		// 웹소켓 서버에 연결되었을 때 실행
		webSocket.onopen = function(event) {
			chatWindow.innerHTML += "웹 소켓 서버에 연결되었습니다. <br>"
		}
		
		// 메세지를 받았을 때 실행
		webSocket.onmessage = function(event){
			let message = event.data.split(" | ");
			let sender = message[0];
			let content = message[1];
			
			if(content != ""){
				chatWindow.innerHTML += "<div>" +sender +" : "+content "</div>";	
			}
			chatWindow.screenTop = chatWindow.scrollHeight;
		}
		// 웹소캣이 닫혔을 때 실행
		webSocket.oncolse= function(evnet){
			chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다. <br>"
		}
		webSocket.onerror = function(event){
			chatWindow.innerHTML+= "채팅 중 에러가 발생하였씁니다. <br>"
		}
		
		// 엔터키 입력처리
		function enterKey() {
			if(window.event.keyCode == 13){
				sendMessage();
			}
		}
	</script>
</body>
</html>


















