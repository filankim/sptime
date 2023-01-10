package com.kh.spacetime.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spacetime.board.model.service.NoticeService;
import com.kh.spacetime.board.model.vo.Notice;
import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.common.template.Pagination;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 공지사항 전체 리스트 조회 - 경미
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping("list.no")
	public String noticeList(Model model) {
		
		/*
		int listCount = noticeService.selectAllListCount();
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		*/
		
		ArrayList<Notice> list = noticeService.selectAllList();
		
		// model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "board/noticeListView";
	}
	
	/**
	 * 공지사항 작성 페이지를 띄워주는 메소드 - 경미
	 * @return
	 */
	@RequestMapping("enrollForm.no")
	public String enrollForm() {
		
		return "board/noticeInsertForm";
	}
	
	/**
	 * 공지사항 작성 메소드 - 경미
	 * @param n
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("insert.no")
	public ModelAndView insertNotice(Notice n, HttpSession session, ModelAndView mv) {
			
		int result = noticeService.insertNotice(n);
		
		if(result > 0) { // 성공 
			
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			mv.setViewName("redirect:/list.no");
		}
		else { // 실패

			mv.addObject("errorMsg", "공지사항 작성 실패, 글자 수를 확인해주세요.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 공지사항 수정 페이지를 띄워주는 메소드 - 경미
	 * @param noticeNo
	 * @param model
	 * @return
	 */
	@RequestMapping("updateForm.no")
	public String updateForm(int noticeNo, Model model) {
		
		Notice n = noticeService.selectNotice(noticeNo); 
		
		model.addAttribute("n", n);
		
		return "board/noticeUpdateForm";
	}
	
	/**
	 * 공지사항 수정 - 경미
	 * @param n
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("update.no")
	public String updateNotice(Notice n, HttpSession session, Model model) {
		
		int result = noticeService.updateNotice(n);
		
		if(result > 0) { // 게시글 수정 성공
			
			session.setAttribute("alertMsg", "성공적으로 공지사항이 수정되었습니다.");
			
			return "redirect:/list.no";
		}
		else { // 게시글 수정 실패
			
			model.addAttribute("errorMsg", "공지사항 수정 실패");
			
			return "common/errorPage";
		}
	}
	
	/**
	 * 공지사항 삭제 - 경미
	 * @param noticeNo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("delete.no")
	public String deleteNotice(int noticeNo, HttpSession session, Model model) {
		
		int result = noticeService.deleteNotice(noticeNo);
		
		if(result > 0) { // 게시글 삭제 성공
			
			session.setAttribute("alertMsg", "성공적으로 공지사항이 삭제되었습니다.");
			return "redirect:/list.no";
		}
		else { // 게시글 삭제 실패
			
			model.addAttribute("errorMsg", "공지사항 삭제 실패");
			return "common/errorPage";
		}
	}
	
	/**
	 * 공지사항 검색 리스트 조회 - 경미
	 * @param currentPage
	 * @param searchText
	 * @param model
	 * @return
	 */
	@RequestMapping("searchList.no")
	public String noticeSearchList(String searchText, Model model) {
		// @RequestParam(value="cpage", defaultValue="1")int currentPage, 
		/*
		int listCount = noticeService.selectSearchListCount(searchText);

		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		*/
		ArrayList<Notice> list = noticeService.selectSearchList(searchText);
		
		// model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "board/noticeListView";
	}

}
