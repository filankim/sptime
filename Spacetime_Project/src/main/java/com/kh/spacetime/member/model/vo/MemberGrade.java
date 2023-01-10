package com.kh.spacetime.member.model.vo;

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
public class MemberGrade {
	
	private String grCode; // GR_CODE	CHAR(1 BYTE)
	private String grName; // GR_NAME	VARCHAR2(10 BYTE)
	private int discount; // DISCOUNT	NUMBER
	private int totalAmount; // TOTAL_AMOUNT	NUMBER

}
