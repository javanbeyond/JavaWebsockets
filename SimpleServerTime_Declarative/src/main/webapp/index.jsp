<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web Socket JavaScript time Client</title>
<script language="javascript" type="text/javascript"> 
	var time_websocket;
	function init() {
		output_message = document.getElementById("output-message");
	}
	function send_time() {
		// the url to connect to Server. Check the protocol here is ws.
		var wsUri = "ws://localhost:8080/SimpleServerTime/getTime";
		output("Connecting to " + wsUri);
		// create a Websocket object for websocket connection
		time_websocket = new WebSocket(wsUri);
		
		// Different life cycle events called
		// in different stages of web socket connection.
		time_websocket.onopen = function(evt) {
			output("Connected !");
			var clientTime = new Date().toLocaleTimeString();
			doSend(clientTime);
		};
		time_websocket.onmessage = function(evt) {
			output("Received Server message: " + evt.data);
			time_websocket.close();
		};
		time_websocket.onerror = function(evt) {
			output('<span style="color: red;">ERROR:</span> ' + evt.data);
			time_websocket.close();
		};
	}
	function doSend(message) {
		output("My time is: " + message+". What's your time?");
		time_websocket.send(message);
	}
	function output(message) {
		var pre = document.createElement("p");
		pre.innerHTML = message;
		output_message.appendChild(pre);
	}
	window.addEventListener("load", init, false);
</script>
</head>
<body>
	<h1>Time Exchange</h1>
	<div style="text-align: left;">
		<form action="">
			<input onclick="send_time()" value="Press to send browser time" type="button">
		</form>
	</div>
	<div id="output-message"></div>
</body>
</html>