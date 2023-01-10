package com.kh.spacetime.space.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.space.model.dao.SpaceDao;
import com.kh.spacetime.space.model.vo.Bookmark;
import com.kh.spacetime.space.model.vo.Review;
import com.kh.spacetime.space.model.vo.Space;
import com.kh.spacetime.space.model.vo.SpaceAttachment;
import com.kh.spacetime.space.model.vo.SpaceType;

@Service
public class SpaceServiceImpl implements SpaceService {

	@Autowired
	private SpaceDao spaceDao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	//정현 --------------------------
		// 공간타입 가져오기
		@Override
		public ArrayList<SpaceType> selectSpaceTypeList() {
			return spaceDao.selectSpaceTypeList(sqlSession);
		}

		// 공간등록-정현
		@Override
		public int insertSpace(Space s) {
			return spaceDao.insertSpace(sqlSession, s);
		}

		// 공간첨부파일 등록-정현
		@Override
		public int insertSpaceAttachment(List<SpaceAttachment> attachList) {

			return spaceDao.insertSpaceAttachment(sqlSession, attachList);
		}

		// 공간상세 조회-정현
		@Override
		public Space selectSpace(int spaceNo) {
			return spaceDao.selectSpace(sqlSession, spaceNo);
		}

		// 마지막 공간 번호 가져오기
		@Override
		public int selectSpaceNo(int hostNo) {
			return spaceDao.selectSpaceNo(sqlSession, hostNo);
		}

		// 공간삭제-정현
		@Override
		public int deleteSpace(int sno) {
			return spaceDao.deleteSpace(sqlSession, sno);
		}

		// 공간 첨부파일 삭제-정현
		@Override
		public int deleteSpaceAttachment(int sno) {
			return spaceDao.deleteSpaceAttachment(sqlSession, sno);
		}

		// 호스트 공간 첨부파일 조회
		@Override
		public ArrayList<SpaceAttachment> selectSpaceAttachmentList(int sno) {
			return spaceDao.selectSpaceAttachmentList(sqlSession, sno);
		}

		// 호스트 공간 관리 리스트 총 개수
		@Override
		public int selectHostSpaceListCount(int memNo) {
			return spaceDao.selectHostSpaceListCount(sqlSession, memNo);
		}

		// 호스트 공간 리스트
		@Override
		public ArrayList<Space> selectHostSpaceList(int memNo, PageInfo pi) {
			return spaceDao.selectHostSpaceList(sqlSession, memNo, pi);
		}

		// 공간 재검수 등록
		@Override
		public int updateSpace(Space s) {
			return spaceDao.updateSpace(sqlSession, s);
		}
		// 공간 메인 이미지 수정 재검수 등록
		@Override
		public int updateMainImg(SpaceAttachment mainAttach) {
			return spaceDao.updateMainImg(sqlSession, mainAttach);
		}

		// 공간 추가 이미지삭제(재검수) -정현
		@Override
		public int deleteThumImg(int ano) {
			return spaceDao.deleteThumImg(sqlSession, ano);
		}

		// 공간 재검수 등록
		@Override
		public int reInsertSpace(int spaceNo) {
			return spaceDao.reInsertSpace(sqlSession, spaceNo);
		}
		
		//공간 리뷰 총 개수 
		@Override
		public int selectReviewListBySnoCount(int spaceNo) {
			return spaceDao.selectReviewListBySnoCount(sqlSession, spaceNo);
		}
		//공간 리뷰 리스트
		@Override
		public ArrayList<Review> selectReviewListBySno(HashMap<String, Integer> map, PageInfo pi) {
			return spaceDao.selectReviewListBySno(sqlSession, map, pi);
		}
		//--------------------------정현
	
	/*******성훈********************************************/
	// 지도 공간 리스트 -성훈
	@Override
	public ArrayList<Space> selectListForMap(HashMap<String, Double> map) {
	    return spaceDao.selectListForMap(sqlSession, map);
	}
	
	//지도 필터링(지역설정 O) -성훈
	@Override
	public ArrayList<Space> filterListForMap(HashMap<String, Object> map) {
	    return spaceDao.filterListForMap(sqlSession, map);
	}
	
	//지도 필터링(지역설정X => 현재 보여지는 지도) -성훈
	@Override
	public ArrayList<Space> mapFilterOnCurrentMap(HashMap<String, Object> condition){
		return spaceDao.mapFilterOnCurrentMap(sqlSession, condition);
	}
	
	//해시태그 검색 -성훈 
	@Override
	public ArrayList<Space> searchSpaceByHashtag(String keyword){
		return spaceDao.searchSpaceByHashtag(sqlSession, keyword);
	}
	
	//일반 검색 -성훈 
	@Override
	public ArrayList<Space> searchSpaceByKeyword(String keyword){
		return spaceDao.searchSpaceByKeyword(sqlSession, keyword);
	}
	
	/*****************************************************/

	/*
	 * 하연  ------------------------------------
	 */
	
	// 공간 상세 
	@Override
	public Space selectSpaceDetail(int spaceNo) {
		return spaceDao.selectSpaceDetail(sqlSession, spaceNo);
	}
	
	// 공간 상세 - Attachment
	@Override
	public ArrayList<SpaceAttachment> selectSpaceDetailAttachment(int spaceNo) {
		return spaceDao.selectSpaceDetailAttachment(sqlSession, spaceNo);
	}
	

	@Override
	public int insertSpaceReport(Space s) {
		return spaceDao.insertSpaceReport(sqlSession, s);
	}
	
	
	@Override
	public int increaseCount(int sno) {
		
		return spaceDao.increaseCount(sqlSession, sno);
	}
	// 북마크 
	@Override
	public int selectSpaceLike(Bookmark bm) {
		return spaceDao.selectSpaceLike(sqlSession, bm);
	}
	
	@Override
	public int deleteSpaceLike(Bookmark bm) {
		return spaceDao.deleteSpaceLike(sqlSession, bm);
	}
	@Override
	public int insertSpaceLike(Bookmark bm) {
		return spaceDao.insertSpaceLike(sqlSession, bm);
	}
	
	
	// ------------- 하연 끝 ^0^ ---------------
	
	// 뉴스레터 상세 페이지 공간 리스트 해쉬태그 검색 조회 - 경미
	public ArrayList<Space> selectListForNewsletter(HashMap map) {
		return spaceDao.selectListForNewsletter(sqlSession, map);
	}

	// 관리자 공간 리스트 카운트 - 혜민 
	@Override
	public int selectAdminSpaceListCount(HashMap<String, String> map) {
		return spaceDao.selectAdminSpaceListCount(sqlSession, map);
	}

	// 관리자 공간 리스트 조회 - 혜민
	@Override
	public ArrayList<Space> selectAdminSpaceList(PageInfo pi, HashMap<String, String> map) {
		return spaceDao.selectAdminSpaceList(sqlSession, pi, map);
	}

	// 관리자 공간 처리 (승인, 반려) - 혜민 
	@Override
	public int updateAdminSpace(HashMap<String, String> map) {
		return spaceDao.updateAdminSpace(sqlSession, map);
	}

	// 관리자 공간 검색 개수 - 혜민 
	@Override
	public int selectSpaceSearchListCount(HashMap<String, String> map) {

		return spaceDao.selectSpaceSearchListCount(sqlSession, map);
	}

	// 관리자 공간 검색 리스트 조회 - 혜민 
	@Override
	public ArrayList<Space> selectSpaceSearchList(PageInfo pi, HashMap<String, String> map) {

		return spaceDao.selectSpaceSearchList(sqlSession, pi, map);
	}


	// 마이페이지 북마크 - 희섭
	@Override
	public int selectmypagebookmarkListCount(int memNo) {
		
		return spaceDao.selectmypagebookmarkListCount(sqlSession, memNo);
	}
	
	@Override
	public ArrayList<Space> selectmypagebookmarkList(int MemNo, PageInfo pi) {
		
		return spaceDao.selectmypagebookmarkList(sqlSession, MemNo, pi);
	
	}
}
