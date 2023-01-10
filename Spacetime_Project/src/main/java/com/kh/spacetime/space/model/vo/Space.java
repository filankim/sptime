package com.kh.spacetime.space.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 정현
 * 공간 VO 
 */
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Space {
		private int spaceNo;	//	SPACE_NO	NUMBER
		private String spaceTitle;	//	SPACE_TITLE	VARCHAR2(100 BYTE)
		private String spaceSubTitle;	//	SPACE_SUBTITLE	VARCHAR2(500 BYTE)
		private String spaceInfo;	//	SPACE_INFO	VARCHAR2(4000 BYTE)
		private int hourPrice;	//	HOUR_PRICE	NUMBER  
		private int maxPeople;	//	MAX_PEOPLE	NUMBER
		private String addressDefault; 	//	ADDRESS_DEFAULT	VARCHAR2(100 BYTE)
		private String addressDetail;	//	ADDRESS_DETAIL	VARCHAR2(100 BYTE)
		private String tel;	//	TEL	VARCHAR2(11 BYTE)
		private String hashtag;	//	HASHTAG	VARCHAR2(500 BYTE)
		private String spaceStatus;	//	SPACE_STATUS	CHAR(1 BYTE)
		private int count;	//	COUNT	NUMBER
		private double latitude;	//	LATITUDE	NUMBER
		private double longitude;	//	LONGITUDE	NUMBER
		private int openTime;	//	OPEN_TIME	NUMBER
		private int closeTime;	//	CLOSE_TIME	NUMBER
		private String denyMessage;	//	DENY_MESSAGE	VARCHAR2(600 BYTE)
		private String hostNo;	//	HOST_NO	NUMBER  id가 들어갈수있따.
		private String stypeNo;	//	STYPE_NO	NUMBER 공간유형 이름이 들어갈수 있다.
		private List<SpaceAttachment> attachments; // join용
		private String memId; // join 용
		private String bookmarkMem; // join 용
		private String memName; // join 용
		private int rating;
		private String hostAnswer;// join 용
		private Date spaceModifyDate;
		private int reviewNo;
		private String reviewAttach1;
		private String reviewCont;
		private String attachmentReName;
		private String nickName;
		private String profilePath;
}

