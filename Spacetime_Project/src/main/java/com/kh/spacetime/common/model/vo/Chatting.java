package com.kh.spacetime.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Chatting {
	private int chatNo; // CHAT_NO NUMBER
	private String message; // MESSAGE VARCHAR2(1000 BYTE)
	private String messageDate; // MESSAGE_DATE DATE
	private String sender; // SENDER NUMBER
	private String receiver; // RECEIVER NUMBER
	private String roomNo; // ROOM_NO NUMBER
	private String senderName; 
	private String receiverName; 
	private String senderProfilePath; 
	private String receiverProfilePath; 
	private String senderId; 
	private String receiverId; 
}
