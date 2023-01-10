package com.kh.spacetime.space.model.vo;

import com.kh.spacetime.member.model.vo.Member;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author 신희섭 리뷰 VO
 */
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Review {
	private int reviewNo;// REVIEW_NO NUMBER
	private String reviewCont;// REVIEW_CONT VARCHAR2(1000 BYTE)
	private String reviewEnrollDate;// REVIEW_ENROLL_DATE DATE
	private int rating;// RATING NUMBER
	private String status;// REVIEW_STATUS CHAR(1 BYTE)
	private String reviewAttach1;// REVIEW_ATTACH1 VARCHAR2(255 BYTE)
	private String reviewAttach2;// REVIEW_ATTACH2 VARCHAR2(255 BYTE)
	private String reviewAttach3;// REVIEW_ATTACH3 VARCHAR2(255 BYTE)
	private String hostAnswer;// HOST_ANSWER VARCHAR2(300 BYTE)
	private int reserveNo;
	private int memNo;// MEM_NO NUMBER

	private int spaceNo;// SPACE_NO NUMBER
	private String spaceTitle;//

	// 정현 join용
	private Space space;
	private Member member;
	private ReviewLike reviewLike;
}
