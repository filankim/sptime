package com.kh.spacetime.common.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spacetime.common.model.vo.Chatting;
import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.common.model.vo.Report;
import com.kh.spacetime.reserve.model.vo.Reserve;
import com.kh.spacetime.space.model.vo.Space;

public interface CommonService {

	// 신고 글 총 개수
	int selectReportListCount(HashMap<String, String> map);

	// 신고 리스트 조회
	ArrayList<Report> selectReportList(PageInfo pi, HashMap<String, String> map);

	// 신고 상세조회
	Report selectReport(int reportNo);

	// 신고 처리 (승인, 반려)
	int updateReport(HashMap<String, String> map);

	// 블랙리스트 처리 
	int updateBlacklist(String reportedMemNo);

	// 신고 검색 글 개수
	int selectReportSearchListCount(HashMap<String, String> map);

	// 신고 검색 리스트 조회
	ArrayList<Report> selectReportSearchList(PageInfo pi, HashMap<String, String> map);

	// 매출이 있는 공간 총 개수
	int selectSalesListCount();

	// 매출이 있는 공간 리스트 조회
	ArrayList<Reserve> selectSalesList(PageInfo pi);

	// 공간 매출 상세조회
	Reserve selectSales(HashMap<String, String> map);

	// 매출이 있는 공간의 상세 매출 총 개수
	int selectSalesDetailCount(HashMap<String, String> map);

	// 매출이 있는 공간의 상세 매출 조회
	ArrayList<Reserve> selectSalesDetailList(PageInfo pi, HashMap<String, String> map);

	// 매출 검색 글 개수
	int selectSalesSearchListCount(HashMap<String, String> map);

	// 매출 검색 리스트 조회
	ArrayList<Reserve> selectSalesSearchList(PageInfo pi, HashMap<String, String> map);
	
	// 매출차트 보드 조회 
	Reserve selectSalesChartBoard();
	
	// 매출 bar 차트 조회 
	ArrayList<Reserve> selectbChart();
		
	// 매출 doughnut 차트 조회 
	ArrayList<Reserve> selectdChart();

	// 검색어 자동완성
	String autoComplete(String keyword);

	// 해시태그 자동완성
	String hashtagAutoComplete(String keyword);
	
	// 추천공간
	ArrayList<Space> spaceRecommend(String keyword);
		
	// 리뷰존
	ArrayList<Space> spaceReview();

	// ==============================================================================================

	// 마이페이지 신고리스트 조회 - 신희섭
	int selectMypageReportListCount(int reportMemNo);

	ArrayList<Report> selectMypageReportList(int reportMemNo, PageInfo pi);

	// 정현------------
	// 나의 채팅 리스트
	ArrayList<Chatting> selectNoteList(int memNo);

	// 나의 채팅 리스트 검색
	ArrayList<Chatting> searchNoteList(HashMap<String, String> map);

	// 나의 채팅 상세뷰
	ArrayList<Chatting> selectChatList(Chatting c);

	// 채팅 인서트
	int selectRoomNo(Chatting c);
	
	// 채팅 인서트
	int insertChat(Chatting c);

	// 방금보낸 채팅 셀렉
	Chatting selectChat(Chatting c);

	// ------------정현

}
