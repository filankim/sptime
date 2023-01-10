package com.kh.spacetime.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.member.model.dao.MemberDao;
import com.kh.spacetime.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	/**
	 * 로그인 서비스 - 경미
	 */
	@Override
	public Member loginMember(Member m) {
		
		return memberDao.loginMember(sqlSession, m);
	}

	/**
	 * 회원가입 서비스 - 경미
	 */
	@Override
	public int insertMember(Member m) {

		return memberDao.insertMember(sqlSession, m);
	}
	
	/**
	 * 회원정보 업데이트 서비스 - 경미
	 */
	@Override
	public int updateMember(HashMap<String, String> map) {
		
		return memberDao.updateMember(sqlSession, map);
	}
	
	/**
	 * 회원 탈퇴 서비스 - 경미
	 */
	@Override
	public int deleteMember(int memNo) {
		return memberDao.deleteMember(sqlSession, memNo);
	}
	
	/**
	 * 아이디 중복체크 서비스 - 경미
	 */
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession, checkId);
	}
	
	
	/**
	 * 닉네임 중복체크 서비스 - 경미
	 */
	@Override
	public int nickCheck(String checkNick) {
		return memberDao.nickCheck(sqlSession, checkNick);
	}
	
	/**
	 * 이메일 중복체크 서비스 - 경미
	 */
	@Override
	public int emailCheck(String checkEmail) {
		return memberDao.emailCheck(sqlSession, checkEmail);
	}

	/**
	 * 아이디 찾기 서비스  - 경미
	 */
	@Override
	public String findId(Member m) {
		return memberDao.findId(sqlSession, m);
	}
	
	
	/**
	 * 비밀번호 변경 서비스 - 경미
	 */
	@Override
	public int changePwd(Member m) {
		return memberDao.changePwd(sqlSession, m);
	}
	
	/**
	 * 회원 등급 자동 업데이트 서비스 - 경미
	 */
	@Override
	public int updateGrade(int sumPrice, int memNo) {
		
		HashMap<String, Integer> map = new HashMap<>();
		map.put("sumPrice", sumPrice);
		map.put("memNo", memNo);
		
		return memberDao.updateGrade(sqlSession, map);
	}
	
	
	/**
	 * 회원 등급 자동 하향 서비스 - 경미
	 */
	@Override
	public int downGrade(int sumPrice, int memNo) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("sumPrice", sumPrice);
		map.put("memNo", memNo);
		
		return memberDao.downGrade(sqlSession, map);
	}

	// --------------------------------------------------------------
	
	/**
	 * 회원 수 조회 - 혜민 
	 */
	@Override
	public int selectMemberListCount(HashMap<String, String> map) {
		
		return memberDao.selectMemberListCount(sqlSession, map);
	}

	/**
	 * 회원 리스트 조회 - 혜민 
	 */
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi, HashMap<String, String> map) {
		
		return memberDao.selectMemberList(sqlSession, pi, map);
	}

	/**
	 * 회원정보 상세조회 - 혜민 
	 */
	@Override
	public Member selectMember(int memNo) {
		
		return memberDao.selectMember(sqlSession, memNo);
	}
	
	/**
	 * 호스트 신청하기 - 희섭 
	 */
	@Override
	public int inserthostRequest(Member m) {
		return memberDao.inserthostRequest(sqlSession, m);
	}

	/**
	 * 회원 검색 개수 조회 - 혜민 
	 */
	@Override
	public int selectMemberSearchListCount(HashMap<String, String> map) {
		
		return memberDao.selectMemberSearchListCount(sqlSession, map);
	}

	/**
	 * 회원 검색 리스트 조회 - 혜민 
	 */
	@Override
	public ArrayList<Member> selectMemberSearchList(PageInfo pi, HashMap<String, String> map) {

		return memberDao.selectMemberSearchList(sqlSession, pi, map);
	}



}
