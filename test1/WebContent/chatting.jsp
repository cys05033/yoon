<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>채팅창</title>
<script src="http://code.jquery.com/jquery-1.12.0.js"></script>
</head>
<body>
<body>
	    <fieldset>
	        <textarea id="messageWindow" rows="10" cols="50" readonly></textarea>
	        <br/>
	        <input id="nick" type="text" style="width:50px"/>
	        <input id="inputMessage" type="text" onkeyup="enterkey()"/>
	        <input type="submit" value="send" onclick="send()" />
	    </fieldset>
	</body>
	    <script type="text/javascript">
	        var textarea = document.getElementById("messageWindow");
	        var webSocket = new WebSocket('ws://192.168.100.124:8080/test1/broadcasting');
	        var inputMessage = document.getElementById('inputMessage');
	        //var nick = $('#nick').val();
	        //var nick = document.getElementById('nick');
	    webSocket.onerror = function(event) {
	      onError(event)
	    };
	
	    webSocket.onopen = function(event) {
	      onOpen(event)
	    };
	
	    webSocket.onmessage = function(event) {
	      onMessage(event)
	    };
	
	    function onMessage(event) {
	        textarea.value += event.data + "\n";
	    }
	
	    function onOpen(event) {
	        textarea.value += "연결 성공\n";
	    }
	
	    function onError(event) {
	      alert(event.data);
	    }
	
	    function send() {
	    	var nick = $('#nick').val();
	        textarea.value += nick + " : " + inputMessage.value + "\n";
	        webSocket.send(nick + " : " + inputMessage.value);
	        inputMessage.value = "";
	    }
	    function enterkey() {
	        if (window.event.keyCode == 13) {
	            send();
	        }
	    }
	  </script>
</body>
</html>