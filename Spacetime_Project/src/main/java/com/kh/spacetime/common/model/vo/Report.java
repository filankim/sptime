package com.kh.spacetime.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자 
@AllArgsConstructor // 모든 필드를 매개변수로 갖는 생성자 
@Setter // setter 메소드 
@Getter // getter 메소드 
@ToString // toString 메소드 
public class Report {

	private int reportNo; // REPORT_NO	NUMBER
	private String reportType; // REPORT_TYPE	VARCHAR2(30 BYTE)
	private String reportContent; // REPORT_CONTENT	VARCHAR2(600 BYTE)
	private String reportDate; // REPORT_DATE	DATE
	private String reportStatus; // REPORT_STATUS	CHAR(1 BYTE)
	private String reportAnswer; // REPORT_ANSWER	VARCHAR2(300 BYTE)
	private String modifyDate; // MODIFY_DATE	DATE
	private String reportMemNo; // REPORT_MEM_NO	NUMBER
	private String reportedMemNo; // REPORTED_MEM_NO	NUMBER
	
}
