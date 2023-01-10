package com.kh.spacetime.reserve.model.vo;

import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.space.model.vo.Space;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 정현
 *
 */
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Reserve {
		private int reserveNo;	//	RESERVE_NO	NUMBER
		private int reserveCount;	//	RESERVE_COUNT	NUMBER
		private String reserveDate;	//	RESERVE_DATE	DATE
		private String useDate;	//	USE_DATE	DATE
		private int startTime;	//	START_TIME	NUMBER
		private int endTime;	//	END_TIME	NUMBER
		private int price;	//	PRICE	NUMBER
		private int spaceNo;	//	SPACE_NO	NUMBER
		private String memNo;	//	MEM_NO	NUMBER
		private String reserveStatus;	//	RESERVE_STATUS	CHAR(1 BYTE)
		private String denyMessage;	//	DENY_MESSAGE	VARCHAR2(600 BYTE)
		private Space space;  // join용 정현
		private Member member;  // join용 정현
		
		// resultSet join 때문에 추가좀 하겠습니다.. => 하연 
		private String email; 
		private String payMethod;
		private String spaceTitle;
		private String nickname;
		private String attachmentRename;
		
		// 매출관리용 join - 혜민
		private String memName;
		private String memId;
		private String gender;
		private int income;
		private String month;
		private String salesStatus;
		private int incomeTotal;
		private String todaySales;
		private String weekSales;
		private String monthSales;
		private String yearSales;
		private int todaySalesCount;
		private int weekSalesCount;
		private int monthSalesCount;
		private int yearSalesCount;
		private int chartPrice;
		private String chartMonth;
		private String stypeName;
		private int stypeNo;
		private int count;
		
		// 위도경도join 
		private double latitude;
		private double longitude;

}
