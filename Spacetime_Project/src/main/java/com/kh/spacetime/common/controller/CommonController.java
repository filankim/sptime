package com.kh.spacetime.common.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.spacetime.common.model.service.CommonService;
import com.kh.spacetime.common.model.vo.Chatting;
import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.common.model.vo.Report;
import com.kh.spacetime.common.template.Pagination;
import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.reserve.model.vo.Reserve;
import com.kh.spacetime.space.model.vo.Space;

@Controller
public class CommonController {

	@Autowired
	private CommonService commonService;
	
	/**
	 * @author 에러 404
	 */
	@RequestMapping(value = "error404.er")
	public String error404() {
		return "common/errorPage404";
	}
	@RequestMapping(value = "error500.er")
	public String error500() {
		return "common/errorPage500";
	}
	

	/**
	 * 관리자 신고관리 리스트 페이지로 포워딩 - 혜민
	 * 
	 * @return
	 */
	@RequestMapping(value = "rlist.ad")
	public String selectReportList() {

		// /WEB-INF/views/common/adminReport.jsp
		return "common/adminReport";
	}

	/**
	 * 신고페이지 리스트 조회 - 혜민
	 * 
	 * @param currentPage
	 * @param model
	 * @param tab
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "ajaxrlist.ad", produces = "application/json; charset=UTF-8")
	public String ajaxReportList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
			String tab) {

		// System.out.println("컨트롤러 현재페이지 : " + currentPage);
		// System.out.println("컨트롤러 현재 탭 : " + tab);

		HashMap<String, String> map = new HashMap<>();
		map.put("tab", tab);

		int listCount = commonService.selectReportListCount(map);

		// System.out.println("listCount : " + listCount);

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Report> list = commonService.selectReportList(pi, map);

		// System.out.println("list : " + list);
		// System.out.println("pi :" + pi);

		// JSON 형식으로 pi 랑 list 를 넘겨야함!! (두개를 json 으로 묶어서 응답데이터 보내기!!)

		JSONArray jArr = new JSONArray();
		for (Report r : list) {
			JSONObject jObj = new JSONObject();
			jObj.put("reportNo", r.getReportNo());
			jObj.put("reportType", r.getReportType());
			jObj.put("reportContent", r.getReportContent());
			jObj.put("reportDate", r.getReportDate());
			jObj.put("reportStatus", r.getReportStatus());
			jObj.put("reportedMemNo", r.getReportedMemNo());
			jArr.add(jObj);
		}

		JSONObject jObj = new JSONObject();
		jObj.put("listCount", pi.getListCount());		jObj.put("currentPage", pi.getCurrentPage());
		jObj.put("pageLimit", pi.getPageLimit());
		jObj.put("boardLimit", pi.getBoardLimit());
		jObj.put("maxPage", pi.getMaxPage());
		jObj.put("startPage", pi.getStartPage());
		jObj.put("endPage", pi.getEndPage());

		JSONObject json = new JSONObject();
		json.put("list", jArr); // 0번 인덱스
		json.put("pi", jObj); // 1번 인덱스

		// System.out.println(json);

		return json.toJSONString();
	}

	/**
	 * 관리자 신고 상세조회 메소드 - 혜민
	 * 
	 * @param rpno
	 * @param mv
	 * @return
	 */
	@RequestMapping("rdetail.ad")
	public ModelAndView selectReport(int rpno, ModelAndView mv) {

		Report r = commonService.selectReport(rpno);

		// System.out.println(rpno);

		mv.addObject("r", r).setViewName("common/adminReportDetail");

		return mv;
	}

	/**
	 * 관리자 신고처리 메소드 - 혜민
	 * 
	 * @param r
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("updateReport.ad")
	public String updateReport(Report r, Model model, HttpSession session) {

		String reportedMemNo = r.getReportedMemNo();
		System.out.println(reportedMemNo);
		
		HashMap<String, String> map = new HashMap<>();

		String reportNo = Integer.toString(r.getReportNo());

		map.put("reportNo", reportNo);

		if (r.getReportStatus() != null) {
			map.put("reportStatus", r.getReportStatus());
			map.put("reportAnswer", r.getReportAnswer());
		}

		int result = commonService.updateReport(map);

		if (result > 0) { // 신고처리 성공
			
			int resultBlack = commonService.updateBlacklist(reportedMemNo);
			
				if(resultBlack > 0) { // 신고 5회이상, 블랙리스트로 업데이트 성공 
					session.setAttribute("alertMsg", "신고 누적 5회, 블랙리스트 처리 성공");
				} else { // 신고 5회 미만
					session.setAttribute("alertMsg", "신고처리가 완료되었습니다.");
				}
			return "redirect:/rdetail.ad?rpno=" + r.getReportNo();

		} else { // 신고처리 실패

			model.addAttribute("errorMsg", "신고처리 실패");
			return "common/errorPage";
		}
	}

	/**
	 * 관리자 신고검색 - 혜민
	 * 
	 * @param currentPage
	 * @param model
	 * @param condition
	 * @param keyword
	 * @return
	 */
	@RequestMapping("searchR.ad")
	public String selectReportSearchList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			Model model, String condition, String keyword) {

		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		int listCount = commonService.selectReportSearchListCount(map);

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Report> list = commonService.selectReportSearchList(pi, map);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		System.out.println(pi);
		System.out.println(list);

		return "common/adminReportSearch";
	}
	
	/**
	 * 관리자 매출관리 리스트 조회 - 혜민
	 * 
	 * @return
	 */
	@RequestMapping("slist.ad")
	public String selectSalesList(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = commonService.selectSalesListCount();
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Reserve> list = commonService.selectSalesList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		// System.out.println(model);
		
		return "common/adminSales";
	}
	
	/**
	 * 관리자 매출 상세조회 - 혜민
	 * 
	 * @param spno
	 * @param mv
	 * @return
	 */
	@RequestMapping("sdetail.ad")
	public String selcetSales(int sno, String month, Model model) {
		
		String spaceNo = Integer.toString(sno);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("month", month);
		map.put("spaceNo", spaceNo);
		
		// System.out.println("map : " + map);
		
		Reserve r = commonService.selectSales(map);

		// System.out.println("r : " + r);
		
		model.addAttribute("r", r);
		model.addAttribute("month", month);
		
		// System.out.println("model : " + model);

		return "common/adminSalesDetail";
	}
	
	/**
	 * 관리자 매출 월별 조회 - 혜민 
	 * @param currentPage
	 * @param model
	 * @param sno
	 * @param month
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "ajaxsdlist.ad", produces = "application/json; charset=UTF-8")
	public String ajaxSalesDetailList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
			int sno, String month) {

		// System.out.println(month);

		HashMap<String, String> map = new HashMap<>();

		String spaceNo = Integer.toString(sno);
		map.put("month", month);
		map.put("spaceNo", spaceNo);

		// System.out.println(map);

		int listCount = commonService.selectSalesDetailCount(map);

		// System.out.println("listCount : " + listCount);

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Reserve> list = commonService.selectSalesDetailList(pi, map);

		// System.out.println(list);

		JSONArray jArr = new JSONArray();
		for (Reserve r : list) {
			JSONObject jObj = new JSONObject();
			jObj.put("useDate", r.getUseDate());
			jObj.put("startTime", r.getStartTime());
			jObj.put("price", r.getPrice());
			jObj.put("income", r.getIncome());
			jArr.add(jObj);
		}

		JSONObject jObj = new JSONObject();
		jObj.put("listCount", pi.getListCount());
		jObj.put("currentPage", pi.getCurrentPage());
		jObj.put("pageLimit", pi.getPageLimit());
		jObj.put("boardLimit", pi.getBoardLimit());
		jObj.put("maxPage", pi.getMaxPage());
		jObj.put("startPage", pi.getStartPage());
		jObj.put("endPage", pi.getEndPage());

		JSONObject json = new JSONObject();
		json.put("list", jArr);
		json.put("pi", jObj);

		// System.out.println("컨트롤러에서 찍히는 json : " + json);

		return json.toJSONString();
	}
	
	/**
	 * 관리자 매출 검색 - 혜민
	 * @param currentPage
	 * @param model
	 * @param condition
	 * @param keyword
	 * @param month
	 * @return
	 */
	@RequestMapping("searchS.ad")
	public String selectSalesSearchList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model, String condition, String keyword, String month) {
		
		LocalDate now = LocalDate.now();
		
		int year = now.getYear();
		int Month = now.getMonthValue();
		String thisMonth = year + "-" + Month;
		// System.out.println(thisMonth);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("month", month);
		
		int listCount = commonService.selectSalesSearchListCount(map);
		
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Reserve> list = commonService.selectSalesSearchList(pi, map);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("month", month);
		model.addAttribute("thisMonth", thisMonth);
		
//		System.out.println("model" + model);
		
		// System.out.println(pi);
		// System.out.println(list);
		
		return "common/adminSalesSearch";
	}
	
	/**
	 * 관리자 매출 통계 페이지 메소드 - 혜민 
	 * @return
	 */
	@RequestMapping(value="schart.ad") 
	public ModelAndView selectSalesChartBoard(ModelAndView mv) {
		
		Reserve r = commonService.selectSalesChartBoard();
		ArrayList<Reserve> bList = commonService.selectbChart();
		ArrayList<Reserve> dList = commonService.selectdChart();
		
		mv.addObject("r", r);
		mv.addObject("bList", bList);
		mv.addObject("dList", dList);
		
		mv.setViewName("common/adminSalesChart");
		
		return mv;
	}
	
	
	/**
	 * 헤더에서 서비스정보 페이지 이동 - 하연
	 */
	@RequestMapping("introduction.co")
	public String introduction() {

		return "common/introduction";
	}

	/**
	 * 
	 * @param keyword
	 * @param mv
	 * @return
	 * @author 성훈
	 */
	// 검색어 자동완성 -성훈
	@ResponseBody
	@RequestMapping(value = "autoComplete.co", produces = "text/html; charset=UTF-8")
	public String autoComplete(String keyword) {
		String keywords = commonService.autoComplete(keyword);
		
		return keywords;
	}


	/**
	 * 
	 * @param keyword
	 * @param mv
	 * @return
	 * @author 성훈
	 */
	// 해시태그 자동완성 -성훈
	@ResponseBody
	@RequestMapping(value = "hashtagAutoComplete.co", produces = "text/html; charset=UTF-8")
	public String hashtagAutoComplete(String keyword) {
		String keywords = commonService.hashtagAutoComplete(keyword);
		
		String[] keywordArr = keywords.split(",");

		return keywords;
	}
	
	//추천공간리스트 -성훈
	@ResponseBody
	@RequestMapping(value="spaceRecommend.co", produces = "application/json; charset=UTF-8")
	public String spaceRecommend(String keyword){
	    ArrayList<Space> recommendList = commonService.spaceRecommend(keyword);
	    
	    return new Gson().toJson(recommendList);
	}

	//리뷰존리스트 -성훈
	@ResponseBody
	@RequestMapping(value="spaceReview.co", produces = "application/json; charset=UTF-8")
	public String spaceReview(){
	    ArrayList<Space> reviewList = commonService.spaceReview();
	    
	    return new Gson().toJson(reviewList);
	}

	/**
	 * 마이페이지 신고리스트 - 신희섭
	 */

	// 마이페이지 신고리스트
	@RequestMapping("report.co")
	public String selectmypagereport(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
			HttpSession session) {

		System.out.println("cpage : " + currentPage);
		// int reportMemNo= ((Member)Session.getAttribute("loginMember")).getMemNo() ;
		Member m = (Member) session.getAttribute("loginMember");
		int reportMemNo = m.getMemNo();

		int listCount = commonService.selectMypageReportListCount(reportMemNo);

		int pageLimit = 10;
		int boardLimit = 5;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Report> list = commonService.selectMypageReportList(reportMemNo, pi);
		System.out.println(list);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		// /WEB-INF/views/board/boardListView.jsp
		return "common/mypageReport";
	}

	/**
	 * 이용약관 페이지를 띄워주는 메소드 - 경미
	 * 
	 * @return
	 */
	@RequestMapping("userAgreement.co")
	public String userAgreements() {
		return "common/userAgreements";
	}

	/**
	 * 개인정보처리방침 페이지를 띄워주는 메소드 - 경미
	 * 
	 * @return
	 */
	@RequestMapping("privacyPolicy.co")
	public String privacyPolicy() {
		return "common/privacyPolicy";
	}

	/**
	 * 운영정책 페이지를 띄워주는 메소드 - 경미
	 * 
	 * @return
	 */
	@RequestMapping("managementPolicy.co")
	public String managementPolicy() {
		return "common/managementPolicy";
	}

	// 정현---------------------
	/**
	 * @author 정현 나의 쪽지함 리스트
	 */
	@RequestMapping("note.me")
	public String selectNoteList(@RequestParam(value = "npage", defaultValue = "1") int currentPage, Model model,
			HttpSession session) {

		Member loginMember = (Member)session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();

		ArrayList<Chatting> rList = commonService.selectNoteList(memNo);

		model.addAttribute("rList", rList);

		return "common/myChatList";
	}

	/**
	 * @author 정현 나의 쪽지함 리스트 검색
	 */
	@RequestMapping("schNote.me")
	public String searchNoteList(@RequestParam(value = "npage", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, Model model, HttpSession session) {

		Member loginMember = (Member) session.getAttribute("loginMember");
		String memNo = String.valueOf(loginMember.getMemNo());

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("memNo", memNo);
		map.put("keyword", keyword);

		ArrayList<Chatting> rList = commonService.searchNoteList(map);

		model.addAttribute("rList", rList);

		return "common/myChatList";
	}

	/**
	 * @author 정현 챗 상세뷰
	 */
	@ResponseBody
	@RequestMapping(value = "detailChat.me", produces = "application/json; charset=UTF-8")
	public String selectChatList(Chatting c, HttpSession session) {
		ArrayList<Chatting> cList = commonService.selectChatList(c);

		return new Gson().toJson(cList);
	}
	
	/**
	 * @author 정현 챗 인서트
	 */
	@ResponseBody
	@RequestMapping(value = "insertChat.me", produces = "application/json; charset=UTF-8")
	public String insertChat(Chatting c, HttpSession session) {
		
		commonService.insertChat(c);
		Chatting result = commonService.selectChat(c);

		return new Gson().toJson(result);
	}
	


	// ---------------------정현

}
