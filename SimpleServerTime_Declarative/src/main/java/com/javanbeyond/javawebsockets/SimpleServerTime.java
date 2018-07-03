package com.javanbeyond.javawebsockets;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.websocket.OnMessage;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/getTime")
public class SimpleServerTime {

	@OnMessage
	public String getServerTime(String clientTime) throws InterruptedException {
		/// Sleep for 1 second to create a difference between client and server time
		Thread.sleep(1000);
		String serverTime = new SimpleDateFormat("hh:mm:ss a")
				.format(new Date());
		return "You sent " + serverTime + ". But my time is : " + serverTime;
	}

}
