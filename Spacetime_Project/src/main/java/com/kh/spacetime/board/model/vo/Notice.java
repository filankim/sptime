package com.kh.spacetime.board.model.vo;

import java.sql.Date;

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
public class Notice {
	
	private int noticeNo; // NOTICE_NO	NUMBER
	private String noticeTitle; // NOTICE_TITLE	VARCHAR2(100 BYTE)
	private String noticeCont; // NOTICE_CONTENT	VARCHAR2(400 BYTE)
	private Date noticeEnrollDate; // NOTICE_ENROLL_DATE	DATE
	private String noticeStatus; // NOTICE_STATUS	CHAR(1 BYTE)
}
