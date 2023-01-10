package com.kh.spacetime.space.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.common.model.vo.Report;
import com.kh.spacetime.space.model.vo.Review;
import com.kh.spacetime.space.model.vo.ReviewLike;
import com.kh.spacetime.space.model.vo.Space;

public interface ReviewService {
	// 리뷰 리스트 조회 서비스 + 페이징처리
	// 마이페이지 리뷰의 총 갯수
	int selectListCount(int memNo);

	// 리뷰 리스트 조회
	ArrayList<Review> selectList(PageInfo pi, int memNo);

	// 리뷰 상세 조회 서비스
	// 리뷰 글 조회수 증가
	int increaseCount(int reviewNo);

	// 리뷰 상세 조회 요청
	Review selectReview(int reviewNo);

	// 리뷰 삭제 서비스
	int deleteReview(int reviewNo);

	// 리뷰 수정 서비스
	int updateReview(Review r);

	// 정현--------------------
	// 사용자 리뷰 등록 서비스
	int insertReview(Review r);

	ArrayList<Space> selectMySpaceList(int memNo);

	// 호스트 이용후기관리 리스트 개수
	int selectHostReviewListCount(int memNo);

	// 호스트 이용후기관리 리스트
	ArrayList<Review> selectHostReviewList(int memNo, PageInfo pi);

	// 호스트 이용후기 답글 달기
	int insertReviewAnswer(Review r);

	// 호스트 이용후기 관리 검색 리스트 개수
	int searchHostReviewListCount(HashMap<String, String> map);

	// 호스트 이용후기관리 검색 리스트
	ArrayList<Review> searchHostReviewList(HashMap<String, String> map, PageInfo pi);

	// 리뷰 좋아요 추가
	int insertReviewLike(ReviewLike r);

	// 리뷰 좋아요 삭제
	int deleteReviewLike(ReviewLike r);
	
	// 사용자 신고
	int insertReport(Report r);
	
	// 신고 카운트
	int countReport(Report r);

	// ---------------------정현

}
