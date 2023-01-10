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
public class Newsletter {
	
	private int newsNo; // NEWS_NO	NUMBER
	private String newsTitle; // NEWS_TITLE	VARCHAR2(100 BYTE)
	private String newsCont; // NEWS_CONTENT	LONG
	private Date newsEnrollDate; // NEWS_ENROLL_DATE	DATE
	private int newsCount; // NEWS_COUNT	NUMBER
	private String newsStatus; // NEWS_STATUS	CHAR(1 BYTE)
	private String newsThumbnail; // NEWS_THUMBNAIL	VARCHAR2(255 BYTE)
	private String newsKeyword;
}
