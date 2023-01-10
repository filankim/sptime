package com.kh.spacetime.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spacetime.board.model.vo.Newsletter;
import com.kh.spacetime.board.model.vo.Notice;

@Repository
public class NewsletterDao {
	
	/**
	 * 뉴스레터 리스트 Dao - 경미
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Newsletter> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("newsletterMapper.selectList");
	}
	
	/**
	 * 뉴스레터 상세 조회 Dao - 경미
	 * @param sqlSession
	 * @param newsNo
	 * @return
	 */
	public Newsletter selectNewsletter(SqlSessionTemplate sqlSession, int newsNo) {
		
		return sqlSession.selectOne("newsletterMapper.selectNewsletter", newsNo);
	}
	
	/**
	 * 뉴스레터 작성 Dao - 경미
	 * @param sqlSession
	 * @param n
	 * @return
	 */
	public int insertNewsletter(SqlSessionTemplate sqlSession, Newsletter n) {
		
		return sqlSession.insert("newsletterMapper.insertNewsletter", n);
	}
	
	/**
	 * 뉴스레터 수정 Dao - 경미
	 * @param sqlSession
	 * @param n
	 * @return
	 */
	public int updateNewsletter(SqlSessionTemplate sqlSession, Newsletter n) {
		
		return sqlSession.update("newsletterMapper.updateNewsletter", n);
	}
	
	/**
	 * 뉴스레터 삭제 Dao - 경미
	 * @param sqlSession
	 * @param newsNo
	 * @return
	 */
	public int deleteNewsletter(SqlSessionTemplate sqlSession, int newsNo) {
		
		return sqlSession.update("newsletterMapper.deleteNewsletter", newsNo);
	}
	
}
