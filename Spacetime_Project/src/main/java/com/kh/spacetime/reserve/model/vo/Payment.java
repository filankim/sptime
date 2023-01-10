package com.kh.spacetime.reserve.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Payment {
	private String receiptId;	//	RECEIPT_ID	NUMBER
	private String receiptUrl;	//	RECEIPT_URL	VARCHAR2(300 BYTE)
	private String payStatus;	//	PAY_STATUS	CHAR(1 BYTE)
	private int reserveNo;	//	RESERVE_NO	NUMBER
	private String payMethod;	//	PAY_METHOD	VARCHAR2(50 BYTE)
	
	//정현 join용
	private Reserve reserve;  // join용 정현
}
