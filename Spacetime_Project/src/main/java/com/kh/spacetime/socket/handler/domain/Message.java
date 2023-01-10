package com.kh.spacetime.socket.handler.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Message {
	private String msgType;
	private String senderNo;
	private String senderName;
	private String profilePath;
	private String senderId;
	private String receiverId;
	private String message;
	private String messageDate;
	private int roomNo;
	
}
