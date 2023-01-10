package com.kh.spacetime.reserve.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.reserve.model.dao.ReserveDao;
import com.kh.spacetime.reserve.model.vo.Payment;
import com.kh.spacetime.reserve.model.vo.Reserve;
import com.kh.spacetime.space.model.vo.Space;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private ReserveDao reserveDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 정현----------------------
	// 호스트 예약관리 리스트 개수 - 정현
	@Override
	public int selectHostReserveListCount(int memNo) {
		return reserveDao.selectHostReserveListCount(sqlSession, memNo);
	}

	// 호스트 예약관리 리스트 - 정현
	@Override
	public ArrayList<Reserve> selectHostReserveList(int memNo, PageInfo pi) {
		return reserveDao.selectHostReserveList(sqlSession, memNo, pi);
	}

	@Override
	public Reserve selectReserve(int reserveNo) {
		// TODO Auto-generated method stub
		return null;
	}

	// 호스트 예약관리 상태 업데이트 리스트 - 정현
	@Override
	public int updateHostReserve(Reserve r) {
		return reserveDao.updateHostReserve(sqlSession, r);
	}

	// 호스트 검색 예약관리 리스트 총 개수 - 정현
	@Override
	public int searchHostReserveListCount(HashMap<String, String> map) {
		return reserveDao.searchHostReserveListCount(sqlSession, map);
	}

	// 호스트 검색 예약관리 리스트 - 정현
	@Override
	public ArrayList<Reserve> searchHostReserveList(HashMap<String, String> map, PageInfo pi) {
		return reserveDao.searchHostReserveList(sqlSession, map, pi);
	}

	// 호스트 정산 리스트 개수 - 정현
	@Override
	public int selectHostCalculListCount(int memNo) {
		return reserveDao.selectHostCalculListCount(sqlSession, memNo);
	}

	// 호스트 정산 리스트 - 정현
	@Override
	public ArrayList<Payment> selectHostCalculList(int memNo, PageInfo pi) {
		return reserveDao.selectHostCalculList(sqlSession, memNo, pi);
	}

	// 호스트 검색 정산 리스트 개수 - 정현
	@Override
	public int searchHostCalculListCount(HashMap<String, String> map) {
		return reserveDao.searchHostCalculListCount(sqlSession, map);
	}

	// 호스트 검색 정산 리스트 - 정현
	@Override
	public ArrayList<Payment> searchHostCalculList(HashMap<String, String> map, PageInfo pi) {
		return reserveDao.searchHostCalculList(sqlSession, map, pi);
	}

	// PAY_STATUS 취소로 업데이트
	@Override
	public int updatePayment(int rno) {
		return reserveDao.updatePayment(sqlSession, rno);
	}

	// ---------------------정현

	// ----------- 하연 --------------------

	@Override
	public int selectMyReserveListCount(int memNo) {

		return reserveDao.selectMyReserveListCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<Reserve> selectMyReservetList(PageInfo pi, int memNo) {

		return reserveDao.selectMyReservetList(sqlSession, pi, memNo);
	}

	// 검색용 메소드

	@Override
	public int selectMyReserveListSortCount(Member m) {

		return reserveDao.selectMyReserveListSortCount(sqlSession, m);
	}

	@Override
	public int selectMyReserveListSortConfirmCount(Member m) {

		return reserveDao.selectMyReserveListSortConfirmCount(sqlSession, m);
	}

	public int selectMyReserveListSortUsedCount(Member m) {

		return reserveDao.selectMyReserveListSortUsedCount(sqlSession, m);
	}

	@Override
	public ArrayList<Reserve> selectMyReserveSortList(PageInfo pi, Member m) {

		return reserveDao.selectMyReserveSortList(sqlSession, pi, m);
	}

	@Override
	public ArrayList<Reserve> selectMyReserveSortConfirmList(PageInfo pi, Member m) {

		return reserveDao.selectMyReserveSortConfirmList(sqlSession, pi, m);
	}

	@Override
	public ArrayList<Reserve> selectMyReserveSortUsedList(PageInfo pi, Member m) {

		return reserveDao.selectMyReserveSortUsedList(sqlSession, pi, m);
	}

	/* 예약 상세 */
	@Override
	public Reserve selectMyReserve(int reserveNo) {

		return reserveDao.selectMyReserve(sqlSession, reserveNo);

	}

	/* 예약 취소 */
	@Override
	public int cancleMyReserve(int rno) {

		return reserveDao.cancleMyReserve(sqlSession, rno);
	}

	/* 예약 신고 */
	@Override
	public Space reportMemberInfo(int reserveNo) {

		return reserveDao.reportMemberInfo(sqlSession, reserveNo);

	}

	@Override
	public int insertReportMyReserve(Space s) {

		return reserveDao.insertReportMyReserve(sqlSession, s);
	}

	// 예약 현황 가져오기
	@Override
	public ArrayList<Reserve> selectReserveTime(int spaceNo) {

		return reserveDao.selectReserveTime(sqlSession, spaceNo);
	}

	// 예약 insert
	public int insertReserve(Reserve r) {

		return reserveDao.insertReserve(sqlSession, r);
	}

	// 결제하기
	public int insertPay(Payment p) {

		return reserveDao.insertPay(sqlSession, p);
	}

	// ------------------------------------------

	// 회원 등급 업데이트를 위한 결제 금액 SUM - 경미
	@Override
	public int sumPrice(int memNo) {
		int sumPrice = 0;
		String sumStr = reserveDao.sumPrice(sqlSession, memNo);
		if(sumStr != null) {
			sumPrice = Integer.parseInt(sumStr);
		}
		return sumPrice;
	}

	// 결제 취소를 위한 Payment select - 경미
	@Override
	public Payment selectPayment(int reserveNo) {

		return reserveDao.selectPayment(sqlSession, reserveNo);
	}

}
