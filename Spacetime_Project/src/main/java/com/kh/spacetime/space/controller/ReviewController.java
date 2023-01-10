package com.kh.spacetime.space.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.common.model.vo.Report;
import com.kh.spacetime.common.template.Pagination;
import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.space.model.service.ReviewService;
import com.kh.spacetime.space.model.service.SpaceService;
import com.kh.spacetime.space.model.vo.Review;
import com.kh.spacetime.space.model.vo.ReviewLike;
import com.kh.spacetime.space.model.vo.Space;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private SpaceService spaceService;

	// 마이페이지 리뷰 리스트
// 페이징바
	@RequestMapping("list.re")
	public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, HttpSession session,
			Model model) {

//		System.out.println("cpage : " + currentPage);

		Member m = (Member)session.getAttribute("loginMember");
		int memNo = m.getMemNo();
		
		int listCount = reviewService.selectListCount(memNo);
		
		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		// getter setter X
		ArrayList<Review> list = reviewService.selectList(pi, memNo);
//		System.out.println();
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "space/mypageReviewList";
	}

	@RequestMapping("detail.re")
	public ModelAndView selectBoard(int rde, ModelAndView mv, HttpSession session) {

		Review r = reviewService.selectReview(rde);

		
		if (r != null) {

			if (r.getReviewAttach1() != null) {
				r.setReviewAttach1(r.getReviewAttach1());
			}
			if (r.getReviewAttach2() != null) {
				r.setReviewAttach2(r.getReviewAttach2());
			}
			if (r.getReviewAttach3() != null) {
				r.setReviewAttach3(r.getReviewAttach3());
			}
		}
		
		
		System.out.println(r);
		
		// 조회된 데이터를 담아서space/mypageReviewDetail.jsp 로 포워딩
		mv.addObject("r", r).setViewName("space/mypageReviewDetail");

		return mv;

		// return "space/mypageReviewDetail";
	}

	// 리뷰 삭제
	@RequestMapping("delete.re")
	public String deleteReview(int reviewNo, String filePath, HttpSession session, Model model) {

		// System.out.println(rno);

		int result = reviewService.deleteReview(reviewNo);
		System.out.println("rde : " + reviewNo);

		if (result > 0) { // 게시글 삭제 성공

			// 게시판 리스트 페이지 url 재요청
			session.setAttribute("alertMsg", "성공적으로 리뷰가 삭제되었습니다.");

			return "redirect:/list.re";
		} else { // 게시글 삭제 실패

			model.addAttribute("errorMsg", "리뷰 삭제 실패");

			return "common/errorPage";
		}
	}

	@RequestMapping("updateForm.re")
	public String updateFormReview(int reviewNo, Model model) {
		Review r = reviewService.selectReview(reviewNo); // 기존의 상세보기 서비스를 재활용

		model.addAttribute("r", r);

		return "space/mypageReviewUpdate";
	}

	@RequestMapping("update.re")
	public ModelAndView updateReview(Review r, HttpSession session, ModelAndView mv, MultipartFile[] upfile) {
		System.out.println("123" + r);

		for (int i = 0; i < upfile.length; i++) {

			if (!upfile[i].getOriginalFilename().equals("")) {

				String changeName = saveFile(upfile[i], session, "space/review/");

				if (i == 0) {
					r.setReviewAttach1("resources/uploadFiles/space/review/"+changeName);
				} else if (i == 1) {
					r.setReviewAttach2("resources/uploadFiles/space/review/"+changeName);
				} else if (i == 2) {
					r.setReviewAttach3("resources/uploadFiles/space/review/"+changeName);
				}
			}
		}
		// Service 단으로 r 보내기'
		int rno = r.getReviewNo();
		int result = reviewService.updateReview(r);

		if (result > 0) { // 게시글 수정 성공

			session.setAttribute("alertMsg", "성공적으로 리뷰가 수정되었습니다.");

			// 리뷰 상세보기 페이지로 url 재요청
			mv.setViewName("redirect:/detail.re?rde=" + rno);
		} else { // 게시글 수정 실패

			mv.addObject("errorMsg", "리뷰 수정 실패");
			mv.setViewName("redirect:/common/errorPage");

		}
		return mv;
	}

	

	/**
	 * @author 희섭 함수 호출시 route에 본인 업파일 경로 넣으면됨
	 */
	public String saveFile(MultipartFile upfile, HttpSession session, String route) {

		// 파일명 수정 작업 후 서버에 업로드 시키기
		// 예) "flower.png" => "2022112210405012345.png"
		// 1. 원본파일명 뽑아오기
		String originName = upfile.getOriginalFilename(); // "flower.png"

		// 2. 시간 형식을 문자열로 뽑아내기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20221122104050"

		// 3. 뒤에 붙을 5자리 랜덤값 뽑기
		int ranNum = (int) (Math.random() * 90000) + 10000; // 5자리 랜덤값

		// 4. 원본파일로부터 확장자만 뽑기
		String ext = originName.substring(originName.lastIndexOf(".")); // ".png"

		// 5. 모두 이어 붙이기
		String changeName = currentTime + ranNum + ext;

		// 6. 업로드 하고자 하는 서버의 물리적인 실제 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/" + route);

		// 7. 경로와 수정파일명을 합체 후 파일을 업로드해주기
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		return changeName;
	}

	// 정현--------------------
	/**
	 * @author 정현 이용후기 등록
	 */
	@RequestMapping("insert.re")
	public String insertReview(Review r, MultipartFile[] upfile, HttpSession session, Model model) {


		int j= 0;
		for (int i = 0; i < upfile.length; i++) {
			if (!upfile[i].getOriginalFilename().equals("")) {
				
				String changeName = saveFile(upfile[i], session, "space/review/");
				if(j ==0) {
					r.setReviewAttach1("resources/uploadFiles/space/review/"+changeName);
				}else if (j==1) {
					r.setReviewAttach2("resources/uploadFiles/space/review/"+changeName);
				} else if(j==2) {
					r.setReviewAttach3("resources/uploadFiles/space/review/"+changeName);
				}
				j++;
			}
		}
		
		int result = reviewService.insertReview(r);

		if (result > 0) {
			session.setAttribute("alertMsg", "리뷰를 등록했습니다.");
			return "redirect:/myReserve.re";
		} else {
			session.setAttribute("alertMsg", "리뷰를 등록하지 못했습니다.");
			return "common:/errorPage";
		}

	}

	/**
	 * @author 정현 호스트 이용후기관리 리스트
	 */
	@RequestMapping("hostRvwList.rv")
	public String selectHostReviewList(@RequestParam(value = "rpage", defaultValue = "1") int currentPage,
			Model model, HttpSession session) {

		Member loginMember = (Member)session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();

		int listCount = reviewService.selectHostReviewListCount(memNo);
		int pageLimit = 10;
		int boardLimit = 3;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Review> rList = reviewService.selectHostReviewList(memNo, pi);
		ArrayList<Space> sList = reviewService.selectMySpaceList(memNo);

		model.addAttribute("sList", sList);
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);

		return "space/hostReviewList";
	}

	/**
	 * @author 정현 호스트 이용후기관리 검색 리스트
	 */
	@RequestMapping("schHostRvwList.rv")
	public String searchHostReviewList(@RequestParam(value = "rpage", defaultValue = "1") int currentPage,
			@RequestParam(value = "key", defaultValue = "") String keyword,
			@RequestParam(value = "stitle", defaultValue = "") String spaceTitle,
			@RequestParam(value = "hanswer", defaultValue = "") String hostAnswer, Model model, HttpSession session) {

		Member loginMember = (Member)session.getAttribute("loginMember");
		String memNo = String.valueOf(loginMember.getMemNo());

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("memNo", memNo);
		map.put("spaceTitle", spaceTitle);
		map.put("hostAnswer", hostAnswer);
		map.put("keyword", keyword);

		int listCount = reviewService.searchHostReviewListCount(map);
		int pageLimit = 10;
		int boardLimit = 3;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Review> rList = reviewService.searchHostReviewList(map, pi);
		ArrayList<Space> sList = reviewService.selectMySpaceList(Integer.parseInt(memNo));

		model.addAttribute("key", keyword);
		model.addAttribute("stitle", spaceTitle);
		model.addAttribute("hanswer", hostAnswer);
		model.addAttribute("sList", sList);
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);

		return "space/hostReviewList";
	}

	/**
	 * @author 정현 호스트 이용후기 답글 달기
	 */
	@ResponseBody
	@RequestMapping(value = "inHostAns.rv", produces = "text/html; charset=UTF-8")
	public String insertReviewAnswer(Review r) {
		int result = reviewService.insertReviewAnswer(r);

		return (result > 0) ? r.getHostAnswer() : "fail";
	}
	
	/**
	 * @author 정현 리뷰 좋아요
	 */
	@ResponseBody
	@RequestMapping(value = "like.rv", produces = "text/html; charset=UTF-8")
	public String updateReviewLike(ReviewLike r, int lcount) {
		int result = 1;
		if (lcount == 0) {
			result = reviewService.insertReviewLike(r);
		} else {
			result = reviewService.deleteReviewLike(r);
		}
		return (result > 0) ? "success" : "fail";
	}

	/**
	 * @author 정현 리뷰 리스트 페이징
	 */
	@ResponseBody
	@RequestMapping(value = "list.rv", produces = "application/json; charset=UTF-8")
	public String selctReviewList(int sno,  int page, HttpSession session) {
		Member m = (Member) session.getAttribute("loginMember");
		// 정현
		int listCount = spaceService.selectReviewListBySnoCount(sno);
		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, page, pageLimit, boardLimit);

		HashMap<String, Integer> map = new HashMap<>();

		map.put("spaceNo", sno);
		
		if (m == null) {
			map.put("memNo", null);
		} else {
			map.put("memNo", m.getMemNo());
		}

		ArrayList<Review> reviewList = spaceService.selectReviewListBySno(map, pi);
		
		HashMap<String, Object> map2 = new HashMap<>();
		map2.put("rList", reviewList);
		map2.put("pi", pi);
		
		return new Gson().toJson(map2);
	}
	
	/**
	 * @author 정현 사용자 리뷰 신고
	 */
	@ResponseBody
	@RequestMapping(value = "reportReview.rv", produces = "text/html; charset=UTF-8")
	public String insertReportReview(Report r, HttpSession session) {
		int result =  reviewService.insertReport(r);
		return (result > 0) ? "success" : "fail";
	}
	
	/**
	 * @author 정현 신고 카운트
	 */
	@ResponseBody
	@RequestMapping(value = "countReport.rv", produces = "text/html; charset=UTF-8")
	public String countReport(Report r) {
		int result = reviewService.countReport(r);
		return (result > 0) ? "success" : "fail";
	}
	// ------------------정현

}
