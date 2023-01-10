package com.kh.spacetime.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.member.model.vo.Member;

@Repository
public class MemberDao {
	
	/**
	 * 로그인 Dao - 경미
	 * @param sqlSession
	 * @param m
	 * @return Member
	 */
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	/**
	 * 회원가입 Dao - 경미
	 * @param sqlSession
	 * @param m
	 * @return
	 */
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	/**
	 * 아이디 중복체크 Dao - 경미
	 * @param sqlSession
	 * @param checkId
	 * @return
	 */
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	/**
	 * 닉네임 중복체크 Dao - 경미
	 * @param sqlSession
	 * @param checkNick
	 * @return
	 */
	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
	}
	
	/**
	 * 이메일 중복체크 Dao - 경미
	 * @param sqlSession
	 * @param checkEmail
	 * @return
	 */
	public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
		
		return sqlSession.selectOne("memberMapper.emailCheck", checkEmail);
	}
	
	/**
	 * 아이디 찾기 Dao - 경미
	 * @param sqlSession
	 * @param m
	 * @return
	 */
	public String findId(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.findId", m);
	}
	
	/**
	 * 비밀번호 변경 Dao - 경미
	 * @param sqlSession
	 * @param m
	 * @return
	 */
	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.changePwd", m);
	}
	
	/**
	 * 회원 탈퇴 Dao - 경미
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public int deleteMember(SqlSessionTemplate sqlSession, int memNo) {
		
		return sqlSession.update("memberMapper.deleteMember", memNo);
	}
	
	/**
	 * 회원정보 수정 Dao - 경미
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int updateMember(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.update("memberMapper.updateMember", map);
	}
	
	/**
	 * 회원 등급 자동 상향 Dao - 경미
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int updateGrade(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		
		return sqlSession.update("memberMapper.updateGrade", map);
	}
	
	/**
	 * 회원 등급 자동 하향 Dao - 경미
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int downGrade(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		
		return sqlSession.update("memberMapper.downGrade", map);
	}
	
	// ------------------------------------------------------------
	
	/**
	 * 	회원 수 조회 - 혜민 
	 * @param sqlSession
	 * @return
	 */
	public int selectMemberListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("memberMapper.selectMemberListCount", map);
	}
	
	/**
	 * 회원 리스트 조회 - 혜민 
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", map, rowBounds);
	}
	
	/**
	 * 회원정보 상세조회 - 혜민 
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public Member selectMember(SqlSessionTemplate sqlSession, int memNo) {
		
		return sqlSession.selectOne("memberMapper.selectMember", memNo);
	}
	
	/**
	 * 회원 검색 개수 조회 - 혜민 
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int selectMemberSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("memberMapper.selectMemberSearchListCount", map);
	}
	
	/**
	 * 회원 검색 리스트 조회 - 혜민 
	 * @param sqlSession
	 * @param pi
	 * @param map
	 * @return
	 */
	public ArrayList<Member> selectMemberSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberSearchList", map, rowBounds);
	}
	
	/**
	 * 호스트 신청 - 희섭 
	 * @param sqlSession
	 * @param 
	 * @return
	 */
	public int inserthostRequest(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.inserthostRequest", m);
	}
	

}
