package com.kh.spacetime.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spacetime.board.model.dao.NoticeDao;
import com.kh.spacetime.board.model.vo.Notice;
import com.kh.spacetime.common.model.vo.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 공지사항 전체 리스트 카운트용 서비스 - 경미
	 */
	/*
	@Override
	public int selectAllListCount() {
		return noticeDao.selectAllListCount(sqlSession);
	}
	*/

	/**
	 * 공지사항 전체 리스트 조회용 서비스 - 경미
	 */
	@Override
	public ArrayList<Notice> selectAllList() {
		return noticeDao.selectAllList(sqlSession);
	}
	
	/**
	 * 공지사항 작성용 서비스 - 경미
	 */
	@Override
	public int insertNotice(Notice n) {
		return noticeDao.insertNotice(sqlSession, n);
	}
	
	/**
	 * 공지사항 수정용 상세보기 서비스 - 경미
	 */
	@Override
	public Notice selectNotice(int noticeNo) {
		
		return noticeDao.selectNotice(sqlSession, noticeNo);
	}
	
	/**
	 * 공지사항 수정 서비스 - 경미
	 */
	@Override
	public int updateNotice(Notice n) {

		return noticeDao.updateNotice(sqlSession, n);
	}
	
	/**
	 * 공지사항 삭제 서비스 - 경미
	 */
	@Override
	public int deleteNotice(int noticeNo) {

		return noticeDao.deleteNotice(sqlSession, noticeNo);
	}
	
	/**
	 * 공지사항 검색 리스트 카운트용 서비스 - 경미
	 */
	/*
	@Override
	public int selectSearchListCount(String searchText) {

		return noticeDao.selectSearchListCount(sqlSession, searchText);
	}
	*/
	
	/**
	 * 공지사항 검색 리스트 서비스 - 경미
	 */
	@Override
	public ArrayList<Notice> selectSearchList(String searchText) {

		return noticeDao.selectSearchList(sqlSession, searchText);
	}

}
