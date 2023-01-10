package com.kh.spacetime.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spacetime.board.model.vo.Notice;
import com.kh.spacetime.common.model.vo.PageInfo;

@Repository
public class NoticeDao {
	
	/**
	 * 공지사항 전체 리스트 카운트용 Dao - 경미
	 * @param sqlSession
	 * @return
	 */
	/*
	public int selectAllListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("noticeMapper.selectAllListCount");
	}
	*/
	
	/**
	 * 공지사항 전체 리스트 조회용 Dao - 경미
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> selectAllList(SqlSessionTemplate sqlSession) {
		/*
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		*/
		return (ArrayList)sqlSession.selectList("noticeMapper.selectAllList");
	}
	
	/**
	 * 공지사항 작성용 Dao - 경미
	 * @param sqlSession
	 * @param n
	 * @return
	 */
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	/**
	 * 공지사항 수정용 상세보기 Dao - 경미
	 * @param sqlSession
	 * @param noticeNo
	 * @return
	 */
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	/**
	 * 공지사항 수정용 Dao - 경미
	 * @param sqlSession
	 * @param n
	 * @return
	 */
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	/**
	 * 공지사항 삭제용 Dao - 경미
	 * @param sqlSession
	 * @param noticeNo
	 * @return
	 */
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}
	
	
	/**
	 * 공지사항 검색 리스트 카운트용 Dao - 경미
	 * @param sqlSession
	 * @return
	 */
	/*
	public int selectSearchListCount(SqlSessionTemplate sqlSession, String searchText) {
		
		return sqlSession.selectOne("noticeMapper.selectSearchListCount", searchText);
	}
	*/
	
	/**
	 * 공지사항 검색 리스트 조회용 Dao - 경미
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> selectSearchList(SqlSessionTemplate sqlSession, String searchText) {
		
		/*
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		*/
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectSearchList", searchText);
	}
}
