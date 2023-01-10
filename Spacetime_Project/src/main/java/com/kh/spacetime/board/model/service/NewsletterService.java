package com.kh.spacetime.board.model.service;

import java.util.ArrayList;

import com.kh.spacetime.board.model.vo.Newsletter;

public interface NewsletterService {
	
	ArrayList<Newsletter> selectList();
	
	Newsletter selectNewsletter(int newsNo);
	
	int insertNewsletter(Newsletter n);
	
	int updateNewsletter(Newsletter n);
	
	int deleteNewsletter(int newsNo);
}
