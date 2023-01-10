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
public class Member {
	
    private int memNo; // MEM_NO NUMBER CONSTRAINT MEM_PK PRIMARY KEY,
    private String memId; // MEM_ID VARCHAR2(20) NOT NULL CONSTRAINT MEM_ID_UQ UNIQUE,
    private String memPwd; // MEM_PWD VARCHAR2(20) NOT NULL,
    private String memName; // MEM_NAME VARCHAR2(21) NOT NULL,
    private String gender; // GENDER CHAR(1) NOT NULL CONSTRAINT MEM_GENDER_CK CHECK(GENDER IN ('M', 'F')),
    private String birthday; // BIRTHDAY DATE NOT NULL,
    private String nickname; // NICKNAME VARCHAR2(30) NOT NULL CONSTRAINT MEM_NICKNAME_UQ UNIQUE,
    private String phone; // PHONE VARCHAR2(11) NOT NULL,
    private String email; // EMAIL VARCHAR2(30) NOT NULL,
    private String profilePath; // PROFILE_PATH VARCHAR2(255) NULL,
    private Date enrollDate; // ENROLL_DATE DATE DEFAULT SYSDATE NOT NULL,
    private String hostStatus; // HOST_STATUS	CHAR(1)	DEFAULT 'N' NOT NULL CONSTRAINT MEM_HOST_STATUS_CK CHECK(HOST_STATUS IN ('Y', 'N')),
    private String bankName; // BANK_NAME VARCHAR2(50),
    private String accountNum; // ACCOUNT_NUM VARCHAR2(30),
    private String blacklist; // BLACKLIST_YN CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT MEM_BLACKLIST_CK CHECK(BLACKLIST_YN IN ('Y', 'N')),
    private String blacklistReason;// BLACKLIST_REASON VARCHAR2(4000),
    private String memStatus; // MEM_STATUS CHAR(1) DEFAULT 'N' NOT NULL CONSTRAINT MEM_STATUS_CK CHECK(MEM_STATUS IN ('Y', 'N')),
    private String grCode; // GR_CODE CHAR(3) NOT NULL,
    
    private String grName; // join 용 
   
}
