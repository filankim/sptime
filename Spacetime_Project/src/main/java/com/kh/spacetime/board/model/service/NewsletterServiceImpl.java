package com.kh.spacetime.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spacetime.board.model.dao.NewsletterDao;
import com.kh.spacetime.board.model.vo.Newsletter;

@Service
public class NewsletterServiceImpl implements NewsletterService {
	
	@Autowired
	private NewsletterDao newsletterDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 뉴스레터 리스트 조회 - 경미
	 */
	@Override
	public ArrayList<Newsletter> selectList() {
		
		return newsletterDao.selectList(sqlSession);
	}
	
	/**
	 * 뉴스레터 상세 조회 - 경미
	 */
	@Override
	public Newsletter selectNewsletter(int newsNo) {

		return newsletterDao.selectNewsletter(sqlSession, newsNo);
	}
	
	/**
	 * 뉴스레터 작성 서비스 - 경미
	 */
	@Override
	public int insertNewsletter(Newsletter n) {

		return newsletterDao.insertNewsletter(sqlSession, n);
	}
	
	/**
	 * 뉴스레터 수정 - 경미
	 */
	@Override
	public int updateNewsletter(Newsletter n) {

		return newsletterDao.updateNewsletter(sqlSession, n);
	}
	
	/**
	 * 뉴스레터 삭제 서비스 - 경미
	 */
	@Override
	public int deleteNewsletter(int newsNo) {
		// TODO Auto-generated method stub
		return newsletterDao.deleteNewsletter(sqlSession, newsNo);
	}
	
	
}
