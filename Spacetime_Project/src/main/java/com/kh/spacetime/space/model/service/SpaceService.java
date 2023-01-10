package com.kh.spacetime.space.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.space.model.vo.Bookmark;
import com.kh.spacetime.space.model.vo.Review;
import com.kh.spacetime.space.model.vo.Space;
import com.kh.spacetime.space.model.vo.SpaceAttachment;
import com.kh.spacetime.space.model.vo.SpaceType;

public interface SpaceService {
	/**정현*******************************/
	// 공간타입 리스트 가져오기 -정현
	ArrayList<SpaceType> selectSpaceTypeList();

	// 공간 등록 -정현
	int insertSpace(Space s);

	// 공간 첨부파일 추가-정현
	int insertSpaceAttachment(List<SpaceAttachment> attachList);

	// 공간 선택 -정현
	Space selectSpace(int spaceNo);

	// 공간 시퀀스 currval 가져오기 -정현
	int selectSpaceNo(int hostNo);

	// 공간 삭제 -정현
	int deleteSpace(int sno);

	// 공간 첨부파일 삭제 -정현
	int deleteSpaceAttachment(int sno);

	// 호스트 공간 첨부파일 리스트 -정현
	ArrayList<SpaceAttachment> selectSpaceAttachmentList(int sno);

	// 호스트 공간 리스트 총 개수 - 정현
	int selectHostSpaceListCount(int memNo);

	// 호스트 공간 리스트 -정현
	ArrayList<Space> selectHostSpaceList(int memNo, PageInfo pi);

	// 공간 수정(재검수) -정현
	int updateSpace(Space s);

	// 공간 메인 이미지수정(재검수) -정현
	int updateMainImg(SpaceAttachment mainAttach);

	// 공간 메인 이미지수정(재검수) -정현
	int deleteThumImg(int ano);

	// 공간 재검수 등록 -정현
	int reInsertSpace(int spaceNo);

	// 공간 이용후기 총 개수 - 정현
	int selectReviewListBySnoCount(int spaceNo);

	// 공간 이용후기 리스트 가져오기
	ArrayList<Review> selectReviewListBySno(HashMap<String, Integer> map, PageInfo pi);

	/******************************* 정현 **/

	/****** 성훈 *********************************************/
	// 지도 공간 리스트 -성훈
	ArrayList<Space> selectListForMap(HashMap<String, Double> map);

	// 지도 필터링 공간 리스트 -성훈
	ArrayList<Space> filterListForMap(HashMap<String, Object> condition);
	
	// 지도 필터링(지역설정X => 현재 보여지는 지도) -성훈
	ArrayList<Space> mapFilterOnCurrentMap(HashMap<String, Object> condition);
	
	//메인화면에서 해시태그 검색
	public ArrayList<Space> searchSpaceByHashtag(String keyword);
	
	//메인화면에서 일반 검색
	public ArrayList<Space> searchSpaceByKeyword(String keyword);

	/*****************************************************/

	/*
	 * 하연 -------------------------------------
	 */

	// 공간 상세 조회
	Space selectSpaceDetail(int spaceNo);

	// 공간 상세 조회 - Attachment
	ArrayList<SpaceAttachment> selectSpaceDetailAttachment(int spaceNo);

	// 공간 신고
	int insertSpaceReport(Space s);

	// 좋아요 리스트 불러오기
	int selectSpaceLike(Bookmark bm);

	// 좋아요 취소
	int deleteSpaceLike(Bookmark bm);

	// 좋아요 하기
	int insertSpaceLike(Bookmark bm);

	// 조회수 증가
	int increaseCount(int sno);

	// ------------- 하연 끝 ^0^ ---------------

	// 뉴스레터 상세 페이지 공간 리스트 해쉬태그 검색 조회 - 경미
	ArrayList<Space> selectListForNewsletter(HashMap map);

	// 관리자 공간 리스트 카운트 - 혜민
	int selectAdminSpaceListCount(HashMap<String, String> map);

	// 관리자 공간 리스트 조회 - 혜민
	ArrayList<Space> selectAdminSpaceList(PageInfo pi, HashMap<String, String> map);

	// 관리자 공간 처리 (승인, 반려) - 혜민 
	int updateAdminSpace(HashMap<String, String> map);
	
	// 관리자 공간 검색 개수 - 혜민 
	int selectSpaceSearchListCount(HashMap<String, String> map);

	// 관리자 공간 검색 리스트 조회 - 혜민
	ArrayList<Space> selectSpaceSearchList(PageInfo pi, HashMap<String, String> map);
	
	// 마이페이지 -희섭 
	int selectmypagebookmarkListCount(int memNo);
	
	ArrayList<Space> selectmypagebookmarkList(int MemNo, PageInfo pi);

}
