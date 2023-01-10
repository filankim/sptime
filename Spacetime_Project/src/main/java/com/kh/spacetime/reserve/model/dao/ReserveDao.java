package com.kh.spacetime.reserve.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.reserve.model.vo.Payment;
import com.kh.spacetime.reserve.model.vo.Reserve;
import com.kh.spacetime.space.model.vo.Space;

@Repository
public class ReserveDao {

	// ============== 하연
	public int selectMyReserveListCount(SqlSessionTemplate sqlSession, int memNo) {

		return sqlSession.selectOne("reserveMapper.selectMyReserveListCount", memNo);
	}

	public ArrayList<Reserve> selectMyReservetList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("reserveMapper.selectMyReservetList", memNo, rowBounds);
	}

	public int selectMyReserveListSortCount(SqlSessionTemplate sqlSession, Member m) {

		if (m.getMemId().equals("예약대기")) {
			m.setMemId("W");
		} else if (m.getMemId().equals("예약취소")) {
			m.setMemId("C");
		} else {
			m.setMemId("N");
		}

		// System.out.println(m);

		return sqlSession.selectOne("reserveMapper.selectMyReserveListSortCount", m);
	}

	public int selectMyReserveListSortConfirmCount(SqlSessionTemplate sqlSession, Member m) {

		if (m.getMemId().equals("예약확정")) {
			m.setMemId("Y");
		}
		return sqlSession.selectOne("reserveMapper.selectMyReserveListSortConfirmCount", m);
	}

	public int selectMyReserveListSortUsedCount(SqlSessionTemplate sqlSession, Member m) {
		if (m.getMemId().equals("이용완료")) {
			m.setMemId("Y");
		}
		return sqlSession.selectOne("reserveMapper.selectMyReserveListSortUsedCount", m);
	}

	public ArrayList<Reserve> selectMyReserveSortList(SqlSessionTemplate sqlSession, PageInfo pi, Member m) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("reserveMapper.selectMyReserveSortList", m, rowBounds);
	}

	public ArrayList<Reserve> selectMyReserveSortConfirmList(SqlSessionTemplate sqlSession, PageInfo pi, Member m) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("reserveMapper.selectMyReserveSortConfirmList", m, rowBounds);
	}

	public ArrayList<Reserve> selectMyReserveSortUsedList(SqlSessionTemplate sqlSession, PageInfo pi, Member m) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("reserveMapper.selectMyReserveSortUsedList", m, rowBounds);
	}

	/* 예약 상세 */
	public Reserve selectMyReserve(SqlSessionTemplate sqlSession, int reserveNo) {

		return sqlSession.selectOne("reserveMapper.selectMyReserve", reserveNo);

	}

	/* 예약 취소 */
	public int cancleMyReserve(SqlSessionTemplate sqlSession, int rno) {

		return sqlSession.update("reserveMapper.cancleMyReserve", rno);
	}

	/* 예약 신고 */

	public Space reportMemberInfo(SqlSessionTemplate sqlSession, int reserveNo) {

		return sqlSession.selectOne("reserveMapper.reportMemberInfo", reserveNo);

	}

	public int insertReportMyReserve(SqlSessionTemplate sqlSession, Space s) {

		return sqlSession.update("reserveMapper.insertReportMyReserve", s);
	}

	// 예약 현황 가져오기
	public ArrayList<Reserve> selectReserveTime(SqlSessionTemplate sqlSession, int spaceNo) {

		return (ArrayList) sqlSession.selectList("reserveMapper.selectReserveTime", spaceNo);
	}

	// 예약 insert
	public int insertReserve(SqlSessionTemplate sqlSession, Reserve r) {

		return sqlSession.insert("reserveMapper.insertReserve", r);
	}

	// 결제하기
	public int insertPay(SqlSessionTemplate sqlSession, Payment p) {

		return sqlSession.update("reserveMapper.insertPay", p);
	}

	// 정현-------------------------------------------
	// 호스트 공간 예약 리스트 개수 가져오기-정현
	public int selectHostReserveListCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("reserveMapper.selectHostReserveListCount", memNo);
	}

	// 호스트 공간 예약 리스트 가져오기-정현
	public ArrayList<Reserve> selectHostReserveList(SqlSessionTemplate sqlSession, int memNo, PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("reserveMapper.selectHostReserveList", memNo, rowBounds);
	}

	// 호스트 예약관리 상태 업데이트 리스트 - 정현
	public int updateHostReserve(SqlSessionTemplate sqlSession, Reserve r) {
		return sqlSession.update("reserveMapper.updateHostReserve", r);
	}

	// 호스트 검색 예약관리 리스트 총 개수 - 정현
	public int searchHostReserveListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("reserveMapper.searchHostReserveListCount", map);
	}

	// 호스트 검색 예약관리 리스트 - 정현
	public ArrayList<Reserve> searchHostReserveList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("reserveMapper.searchHostReserveList", map, rowBounds);
	}

	// 호스트 정산 리스트 개수 가져오기-정현
	public int selectHostCalculListCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("reserveMapper.selectHostCalculListCount", memNo);
	}

	// 호스트 정산 리스트 가져오기-정현
	public ArrayList<Payment> selectHostCalculList(SqlSessionTemplate sqlSession, int memNo, PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("reserveMapper.selectHostCalculList", memNo, rowBounds);
	}

	// 호스트 검색 정산 리스트 총 개수 - 정현
	public int searchHostCalculListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("reserveMapper.searchHostCalculListCount", map);
	}

	// 호스트 검색 정산 리스트 - 정현
	public ArrayList<Payment> searchHostCalculList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
			PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("reserveMapper.searchHostCalculList", map, rowBounds);
	}

	// PAY_STATUS  취소로 업데이트
	public int updatePayment(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.update("reserveMapper.updatePayment", rno);
	}

	// -------------------------------------------정현

	// 회원 등급 업데이트를 위한 결제 금액 SUM - 경미
	public String sumPrice(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("reserveMapper.sumPrice", memNo);
	}

	// 결제 취소를 위한 Payment select - 경미
	public Payment selectPayment(SqlSessionTemplate sqlSession, int reserveNo) {

		return sqlSession.selectOne("reserveMapper.selectPayment", reserveNo);
	}
}
