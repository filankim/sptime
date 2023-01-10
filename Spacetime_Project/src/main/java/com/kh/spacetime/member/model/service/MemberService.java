package com.kh.spacetime.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.common.model.vo.Report;
import com.kh.spacetime.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 서비스 (select)
	Member loginMember(Member m);
	
	// 회원가입 서비스(insert)
	int insertMember(Member m);
	
	// 회원정보 수정 서비스 (update)
	int updateMember(HashMap<String, String> map);
	
	// 회원탈퇴 서비스 (update)
	int deleteMember(int memNo);
	
	// 아이디 중복체크 서비스 (select)
	int idCheck(String checkId);
	
	// 닉네임 중복체크 서비스 (select)
	int nickCheck(String checkNick);
	
	// 이메일 중복체크 서비스 (select)
	int emailCheck(String checkEmail);
	
	// 아이디 찾기 서비스 (select)
	String findId(Member m);
	
	// 비밀번호 변경 서비스 (update)
	int changePwd(Member m);
	
	// 회원 등급 자동 상향 서비스 (update)
	int updateGrade(int sumPrice, int memNo);
	
	// 회원 등급 자동 하향 서비스
	int downGrade(int sumPrice, int memNo);
	
	//----------------------------희섭
	// 호스트 신청하기 서비스(insert)
	int inserthostRequest(Member m);
	
	
	//	-------------------------------------- 관리자 페이지
	// 회원수 조회  
	int selectMemberListCount(HashMap<String, String> map);
	
	// 회원 리스트 조회  
	ArrayList<Member> selectMemberList(PageInfo pi, HashMap<String, String> map);
	
	// 회원정보 상세조회 
	Member selectMember(int memNo);
	
	// 회원 검색 개수 조회 
	int selectMemberSearchListCount(HashMap<String, String> map);
	
	// 회원 검색 리스트 조회 
	ArrayList<Member> selectMemberSearchList(PageInfo pi, HashMap<String, String> map);
	

}
