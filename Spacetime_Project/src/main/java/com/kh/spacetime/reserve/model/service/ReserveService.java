package com.kh.spacetime.reserve.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.reserve.model.vo.Payment;
import com.kh.spacetime.reserve.model.vo.Reserve;
import com.kh.spacetime.space.model.vo.Space;

public interface ReserveService {
	// 정현----------------------
	/**
	 * @author 정현
	 *
	 */
	// 호스트 예약관리 리스트 개수
	int selectHostReserveListCount(int memNo);

	// 호스트 예약관리 리스트
	ArrayList<Reserve> selectHostReserveList(int memNo, PageInfo pi);

	// 예약 상세 조회
	Reserve selectReserve(int reserveNo);

	// 예약상태 수정
	int updateHostReserve(Reserve r);

	// 호스트 예약관리 검색 리스트 개수
	int searchHostReserveListCount(HashMap<String, String> map);

	// 호스트 예약관리 검색 리스트
	ArrayList<Reserve> searchHostReserveList(HashMap<String, String> map, PageInfo pi);

	//  호스트 정산 리스트 개수
	int selectHostCalculListCount(int memNo);

	// 호스트 정산 리스트
	ArrayList<Payment> selectHostCalculList(int memNo, PageInfo pi);

	//  호스트 정산 검색 리스트 개수
	int searchHostCalculListCount(HashMap<String, String> map);

	// 호스트 정산 검색 리스트
	ArrayList<Payment> searchHostCalculList(HashMap<String, String> map, PageInfo pi);
	
	// PAY_STATUS  취소로 업데이트
	int updatePayment(int rno);

	// ---------------------정현

	/**
	 * @author 하연
	 *
	 */
	// 마이페이지 예약 리스트
	int selectMyReserveListCount(int memNo);

	ArrayList<Reserve> selectMyReservetList(PageInfo pi, int memNo);

	// 마이페이지 예약 리스트 - 드롭박스 정렬
	int selectMyReserveListSortCount(Member m);

	int selectMyReserveListSortConfirmCount(Member m);

	int selectMyReserveListSortUsedCount(Member m);

	ArrayList<Reserve> selectMyReserveSortList(PageInfo pi, Member m);

	ArrayList<Reserve> selectMyReserveSortConfirmList(PageInfo pi, Member m);

	ArrayList<Reserve> selectMyReserveSortUsedList(PageInfo pi, Member m);

	/* 예약 상세 */
	Reserve selectMyReserve(int reserveNo);

	/* 예약 취소 */
	int cancleMyReserve(int rno);

	/* 예약 신고 */
	Space reportMemberInfo(int rno);

	int insertReportMyReserve(Space s);
	
	// 예약 현황 가져오기 
	ArrayList<Reserve> selectReserveTime(int spaceNo);
	
	// 예약 insert 
	int insertReserve(Reserve r);
	
	// 결제하기 
	int insertPay(Payment p);
	
	// ------------------------------------------
	
	// 회원 등급 업데이트를 위한 결제 금액 SUM - 경미
	int sumPrice(int memNo);
	
	// 결제 취소를 위한 select Payment - 경미
	Payment selectPayment(int reserveNo);
}
