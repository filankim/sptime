package com.kh.spacetime.space.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.space.model.vo.Bookmark;
import com.kh.spacetime.space.model.vo.Review;
import com.kh.spacetime.space.model.vo.Space;
import com.kh.spacetime.space.model.vo.SpaceAttachment;
import com.kh.spacetime.space.model.vo.SpaceType;

@Repository
public class SpaceDao {

	// 공간 타입 가져오기-정현
	public ArrayList<SpaceType> selectSpaceTypeList(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("spaceMapper.selectSpaceTypeList");
	}

	// 공간 등록-정현
	public int insertSpace(SqlSessionTemplate sqlSession, Space s) {
		return sqlSession.insert("spaceMapper.insertSpace", s);
	}

	// 공간 첨부파일 등록-정현
	public int insertSpaceAttachment(SqlSessionTemplate sqlSession, List<SpaceAttachment> attachList) {
		return sqlSession.insert("spaceMapper.insertSpaceAttachment", attachList);
	}

	// 공간 선택-정현
	public Space selectSpace(SqlSessionTemplate sqlSession, int spaceNo) {
		return sqlSession.selectOne("spaceMapper.selectSpace", spaceNo);
	}

	// 공간 currval 가져오기-정현
	public int selectSpaceNo(SqlSessionTemplate sqlSession, int hostNo) {
		return sqlSession.selectOne("spaceMapper.selectSpaceNo", hostNo);
	}

	// 공간 삭제-정현
	public int deleteSpace(SqlSessionTemplate sqlSession, int sno) {
		return sqlSession.delete("spaceMapper.deleteSpace", sno);
	}

	// 공간 첨부파일 삭제-정현
	public int deleteSpaceAttachment(SqlSessionTemplate sqlSession, int sno) {
		return sqlSession.delete("spaceMapper.deleteSpaceAttachment", sno);
	}

	// 호스트 공간 첨부파일 리스트 가져오기-정현
	public ArrayList<SpaceAttachment> selectSpaceAttachmentList(SqlSessionTemplate sqlSession, int sno) {
		return (ArrayList) sqlSession.selectList("spaceMapper.selectSpaceAttachmentList", sno);
	}

	// 호스트 공간 총 개수 가져오기-정현
	public int selectHostSpaceListCount(SqlSessionTemplate sqlSession, int memNo) {

		return sqlSession.selectOne("spaceMapper.selectHostSpaceListCount", memNo);
	}

	// 호스트 공간 리스트 가져오기-정현
	public ArrayList<Space> selectHostSpaceList(SqlSessionTemplate sqlSession, int memNo, PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("spaceMapper.selectHostSpaceList", memNo, rowBounds);
	}

	// 공간 등록-정현
	public int updateSpace(SqlSessionTemplate sqlSession, Space s) {
		return sqlSession.update("spaceMapper.updateSpace", s);
	}

	// 공간 메인 이미지 수정 재검수 등록-정현
	public int updateMainImg(SqlSessionTemplate sqlSession, SpaceAttachment mainAttach) {
		return sqlSession.update("spaceMapper.updateMainImg", mainAttach);
	}

	// 공간 기존 추가 이미지 삭제 재검수 등록-정현
	public int deleteThumImg(SqlSessionTemplate sqlSession, int ano) {
		return sqlSession.delete("spaceMapper.deleteThumImg", ano);
	}

	// 공간 재검수 등록-정현
	public int reInsertSpace(SqlSessionTemplate sqlSession, int spaceNo) {
		return sqlSession.update("spaceMapper.reInsertSpace", spaceNo);
	}

	// 공간 리뷰 총 개수 가져오기-정현
	public int selectReviewListBySnoCount(SqlSessionTemplate sqlSession, int spaceNo) {

		return sqlSession.selectOne("spaceMapper.selectReviewListBySnoCount", spaceNo);
	}

	// 공간 리뷰 리스트 가져오기-정현
	public ArrayList<Review> selectReviewListBySno(SqlSessionTemplate sqlSession, HashMap<String, Integer> map,
			PageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("spaceMapper.selectReviewListBySno", map, rowBounds);
	}

	/*****************************************************/

	/******** 성훈 *****************************************/
	// 지도 공간 리스트 -성훈
	public ArrayList<Space> selectListForMap(SqlSessionTemplate sqlSession, HashMap<String, Double> map) {
		return (ArrayList) sqlSession.selectList("spaceMapper.selectListForMap", map);
	}

	// 지도 필터링 공간 리스트(지역설정O) -성훈
	public ArrayList<Space> filterListForMap(SqlSessionTemplate sqlSession, HashMap<String, Object> condition) {
		return (ArrayList) sqlSession.selectList("spaceMapper.filterListForMap", condition);
	}
	
	// 지도 필터링(지역설정X => 현재 보여지는 지도) -성훈
	public ArrayList<Space> mapFilterOnCurrentMap(SqlSessionTemplate sqlSession, HashMap<String, Object> condition){
		return (ArrayList)sqlSession.selectList("spaceMapper.mapFilterOnCurrentMap", condition);
	}
	
	//해시태그 검색 -성훈 
	public ArrayList<Space> searchSpaceByHashtag(SqlSessionTemplate sqlSession, String keyword){
		return (ArrayList)sqlSession.selectList("spaceMapper.searchSpaceByHashtag", keyword);
	}
	
	//일반 검색 -성훈 
	public ArrayList<Space> searchSpaceByKeyword(SqlSessionTemplate sqlSession, String keyword){
		return (ArrayList)sqlSession.selectList("spaceMapper.searchSpaceByKeyword", keyword);
	}

	/*****************************************************/

	// 뉴스레터 상세 페이지 공간 리스트 해쉬태그 검색 조회 - 경미
	public ArrayList<Space> selectListForNewsletter(SqlSessionTemplate sqlSession, HashMap map) {

		return (ArrayList) sqlSession.selectList("spaceMapper.selectListForNewsletter", map);
	}

	/*
	 * 하연 ------------------------------------
	 */

	// 공간 상세
	public Space selectSpaceDetail(SqlSessionTemplate sqlSession, int spaceNo) {
		return sqlSession.selectOne("spaceMapper.selectSpaceDetail", spaceNo);
	}

	// 공간 상세 - Attachment
	public ArrayList<SpaceAttachment> selectSpaceDetailAttachment(SqlSessionTemplate sqlSession, int spaceNo) {
		return (ArrayList) sqlSession.selectList("spaceMapper.selectSpaceDetailAttachment", spaceNo);
	}

	// 공간 신고
	public int insertSpaceReport(SqlSessionTemplate sqlSession, Space s) {
		return sqlSession.delete("spaceMapper.insertSpaceReport", s);
	}

	// 북마크
	public int selectSpaceLike(SqlSessionTemplate sqlSession, Bookmark bm) {

		return sqlSession.selectOne("spaceMapper.selectSpaceLike", bm);
	}

	public int deleteSpaceLike(SqlSessionTemplate sqlSession, Bookmark bm) {

		return sqlSession.delete("spaceMapper.deleteSpaceLike", bm);
	}

	public int insertSpaceLike(SqlSessionTemplate sqlSession, Bookmark bm) {

		return sqlSession.insert("spaceMapper.insertSpaceLike", bm);
	}

	// 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int sno) {

		return sqlSession.update("spaceMapper.increaseCount", sno);
	}

	// ------------- 하연 끝 ^0^ ---------------

	// 관리자 공간 리스트 카운트 - 혜민
	public int selectAdminSpaceListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("spaceMapper.selectAdminSpaceListCount", map);
	}

	// 관리자 공간 리스트 조회 - 혜민
	public ArrayList<Space> selectAdminSpaceList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, String> map) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("spaceMapper.selectAdminSpaceList", map, rowBounds);
	}

	// 관리자 공간 처리 (승인, 반려) - 혜민
	public int updateAdminSpace(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("spaceMapper.updateAdminSpace", map);
	}

	// 관리자 공간 검색 개수 - 혜민
	public int selectSpaceSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("spaceMapper.selectSpaceSearchListCount", map);
	}

	// 관리자 공간 검색 리스트 조회 - 혜민
	public ArrayList<Space> selectSpaceSearchList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, String> map) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("spaceMapper.selectSpaceSearchList", map, rowBounds);
	}

	// 마이페이지 북마크 -희섭
	public int selectmypagebookmarkListCount(SqlSessionTemplate sqlSession, int memNo) {

		return sqlSession.selectOne("commonMapper.selectMypageReportListCount", memNo);
	}

	public ArrayList<Space> selectmypagebookmarkList(SqlSessionTemplate sqlSession, int memNo, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;

		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList) sqlSession.selectList("spaceMapper.selectmypagebookmarkList", memNo, rowBounds);

	}
}
