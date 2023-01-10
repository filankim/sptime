package com.kh.spacetime.reserve.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.kh.spacetime.common.model.vo.PageInfo;
import com.kh.spacetime.common.template.Pagination;
import com.kh.spacetime.member.controller.MailSendService;
import com.kh.spacetime.member.model.service.MemberService;
import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.reserve.model.service.ReserveService;
import com.kh.spacetime.reserve.model.vo.Payment;
import com.kh.spacetime.reserve.model.vo.Reserve;
import com.kh.spacetime.space.model.service.ReviewService;
import com.kh.spacetime.space.model.vo.Space;

import kr.co.bootpay.Bootpay;
import kr.co.bootpay.model.request.Cancel;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService reserveService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private MailSendService mailService; // 이메일 인증

	private Bootpay bootpay = new Bootpay("638d424dd01c7e001e7bd641", "Sm+kU05f6KJuTeZcL65ZZutUQTGedEciqPKbLuIJ06Y="); // 부트페이
																														// API

	// 정현---------------------
	/**
	 * @author 정현 호스트 예약관리 리스트
	 */
	@RequestMapping("revHostList.re")
	public String selectHostReserveList(@RequestParam(value = "rpage", defaultValue = "1") int currentPage, Model model,
			HttpSession session) {

		Member loginMember = (Member)session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();

		int listCount = reserveService.selectHostReserveListCount(memNo);

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Reserve> rList = reserveService.selectHostReserveList(memNo, pi);

		Date now = new Date();
		model.addAttribute("now", now);
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);

		return "reserve/hostReserveList";
	}

	/**
	 * @author 정현 호스트 검색 예약관리 리스트
	 */
	@RequestMapping("schRevHostList.re")
	public String searchHostReserveList(@RequestParam(value = "rpage", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, Model model, HttpSession session) {

		Member loginMember = (Member) session.getAttribute("loginMember");
		String memNo = String.valueOf(loginMember.getMemNo());

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("memNo", memNo);
		map.put("keyword", keyword);

		int listCount = reserveService.searchHostReserveListCount(map);
		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Reserve> rList = reserveService.searchHostReserveList(map, pi);

		Date now = new Date();
		model.addAttribute("now", now);
		model.addAttribute("pi", pi);
		model.addAttribute("rList", rList);

		return "reserve/hostReserveList";
	}

	/**
	 * @author 정현 호스트 정산 리스트
	 */
	@RequestMapping("hostCalList.re")
	public String selectHostReviewList(@RequestParam(value = "rpage", defaultValue = "1") int currentPage, Model model,
			HttpSession session) {

		Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();

		int listCount = reserveService.selectHostCalculListCount(memNo);
		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Payment> pList = reserveService.selectHostCalculList(memNo, pi);
		ArrayList<Space> sList = reviewService.selectMySpaceList(memNo);

		model.addAttribute("sList", sList);
		model.addAttribute("pList", pList);
		model.addAttribute("pi", pi);

		return "reserve/hostCalculationList";
	}

	/**
	 * @author 정현 호스트 검색 정산 리스트
	 */
	@RequestMapping("schhostCalList.re")
	public String searchHostReviewList(@RequestParam(value = "rpage", defaultValue = "1") int currentPage,
			@RequestParam(value = "cstatus", defaultValue = "") String calStatus,
			@RequestParam(value = "stitle", defaultValue = "") String spaceTitle,
			@RequestParam(value = "sdate", defaultValue = "") String sdate,
			@RequestParam(value = "edate", defaultValue = "") String edate, Model model) {

//		Member loginMember = (Member)session.getAttribute("loginMember");
//		int memNo = Integer.parseInt(loginMember.getMemNo());
		String memNo = "5";

		HashMap<String, String> map = new HashMap<String, String>();

		map.put("memNo", memNo);
		map.put("spaceTitle", spaceTitle);
		map.put("calStatus", calStatus);
		map.put("sdate", sdate);
		map.put("edate", edate);

		int listCount = reserveService.searchHostCalculListCount(map);
		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Payment> pList = reserveService.searchHostCalculList(map, pi);
		ArrayList<Space> sList = reviewService.selectMySpaceList(Integer.parseInt(memNo));

		model.addAttribute("sList", sList);
		model.addAttribute("stitle", spaceTitle);
		model.addAttribute("cstatus", calStatus);
		model.addAttribute("sdate", sdate);
		model.addAttribute("edate", edate);
		model.addAttribute("pList", pList);
		model.addAttribute("pi", pi);

		return "reserve/hostCalculationList";
	}

	/**
	 * 호스트 예약관리 업데이트 -승인
	 * 
	 * @author 정현
	 */
	@RequestMapping("updateHostRev.re")
	public ModelAndView updateHostReserve(Reserve r, HttpSession session, ModelAndView mv) {
		int result = reserveService.updateHostReserve(r);
		int rno = r.getReserveNo();

		if (result > 0) {
			if (r.getReserveStatus().equals("Y")) {
				session.setAttribute("alertMsg", "예약을 확정하였습니다.");
				mv.setViewName("redirect:/revHostList.re");
			} else {
				// 부트페이 결제 취소 - 경미
				try {
					HashMap<String, Object> token = bootpay.getAccessToken();

					if (token.get("error_code") != null) { // 토큰 발급 실패 시

						System.out.println("토큰 발급 실패");
						session.setAttribute("alertMsg", "결제 취소가 실패하였습니다. 관리자에게 문의해주세요.");
						mv.setViewName("common/errorPage");
					}

					String receiptId = reserveService.selectPayment(rno).getReceiptId();

					Cancel cancel = new Cancel();
					cancel.receiptId = receiptId;
					cancel.cancelUsername = "관리자";
					cancel.cancelMessage = "예약 취소";

					HashMap<String, Object> res = bootpay.receiptCancel(cancel);
					if (res.get("error_code") == null) { // 결제 취소 성공
						//payment pay_status 업데이트
						reserveService.updatePayment(rno);
						
						// 예약 취소 시 회원 등급 자동 변경 - 경미
						int memNo = ((Member) session.getAttribute("loginMember")).getMemNo();
						int sumPrice = reserveService.sumPrice(memNo);
						int upgradeResult = memberService.downGrade(sumPrice, memNo);
						

						session.setAttribute("alertMsg", "예약을 취소하였습니다.");
						mv.setViewName("redirect:/revHostList.re");

					} else { // 결제 취소 실패
						session.setAttribute("alertMsg", "예약 취소가 실패하였습니다. 관리자에게 문의해주세요.");
						mv.setViewName("common/errorPage");
					}
				} catch (Exception e) {
					e.printStackTrace();
					session.setAttribute("alertMsg", "예약 취소가 실패하였습니다. 관리자에게 문의해주세요.");
					mv.setViewName("common/errorPage");
				}
			}
		} else {
			mv.addObject("errorMsg", "예약 업데이트 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	// ---------------------정현

	/**
	 * @author 하연 마이페이지 예약 리스트
	 */

	/* 마이페이지 예약리스트 */

	@RequestMapping("myReserve.re")
	public String selectMyReserveList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
			HttpSession session) {

		int memNo = ((Member) session.getAttribute("loginMember")).getMemNo();

		int listCount = reserveService.selectMyReserveListCount(memNo);
		int pageLimit = 10;
		int boardLimit = 9;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Reserve> list = reserveService.selectMyReservetList(pi, memNo);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

//		System.out.println(list);

		return "reserve/reserveList";

	}

	/* 마이페이지 예약리스트 - 드롭박스 정렬 (예약대기 / 예약취소 / 예약확정 / 이용완료 ) */

	static int sortListCount = 0; // 초기화 - 필터 페이징때문에 밖에 빼둠요 ~~~~~~

	@RequestMapping("myReserveSort.re")
	public String selectMyReserveListSort(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			Model model, HttpSession session, String selectbox) {

		int memNo = ((Member) session.getAttribute("loginMember")).getMemNo();

		// selectbox 랑 memNo 같이 묶어서 보내기 위한 객체
		Member m = new Member();
		m.setMemNo(memNo);
		m.setMemId(selectbox); // => 아이디 아닌데 그냥 형 맞아서 넣음

		String compare = "";

		switch (selectbox) {
		case "예약대기":
			selectbox = "W";
			sortListCount = reserveService.selectMyReserveListSortCount(m);
			break;
		case "예약취소":
			selectbox = "C";
			sortListCount = reserveService.selectMyReserveListSortCount(m);
			break;
		case "예약반려":
			selectbox = "N";
			sortListCount = reserveService.selectMyReserveListSortCount(m);
			break;
		case "예약확정":
			selectbox = "Y";
			// System.out.println(selectbox);
			sortListCount = reserveService.selectMyReserveListSortConfirmCount(m);
			break; // 기본 카운트
		case "이용완료":
			selectbox = "Y";
			compare = "D";
			sortListCount = reserveService.selectMyReserveListSortUsedCount(m);
			break; // 현재날짜 비교해서 이용완료 뽑는 카운트
		}

		m.setMemId(selectbox); // 밑에 메소드에서 재활용할거

		int pageLimit = 10;
		int boardLimit = 9;

		PageInfo pi = Pagination.getPageInfo(sortListCount, currentPage, pageLimit, boardLimit);

		ArrayList<Reserve> list = null;

		if (selectbox.equals("W") && compare.equals("")) {
			list = reserveService.selectMyReserveSortList(pi, m);
		} else if (selectbox.equals("C") && compare.equals("")) {
			list = reserveService.selectMyReserveSortList(pi, m);
		} else if (selectbox.equals("N") && compare.equals("")) {
			list = reserveService.selectMyReserveSortList(pi, m);
		} else if (selectbox.equals("Y") && compare.equals("D")) { // 이용완료인경우
			list = reserveService.selectMyReserveSortUsedList(pi, m);
		} else {
			list = reserveService.selectMyReserveSortConfirmList(pi, m);
		}

		// System.out.println(list);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("selectbox", selectbox);

		return "reserve/reserveFilterList";
	}

	/* 예약 상세 */
	@RequestMapping("reserveDetail.re")
	public ModelAndView selectMyReserveDetail(int rno, ModelAndView mv) {

		Reserve r = reserveService.selectMyReserve(rno);

		System.out.println(r);

		mv.addObject("r", r).setViewName("reserve/reserveDetailView");

		return mv;
	}

	// 예약 취소
	@RequestMapping("cancleMyReserve.re")
	public ModelAndView cancleMyReserve(int rno, HttpSession session, ModelAndView mv) {

		int result = reserveService.cancleMyReserve(rno);

		if (result > 0) { // 예약 취소 성공

			// 부트페이 결제 취소 - 경미
			try {
				HashMap<String, Object> token = bootpay.getAccessToken();

				if (token.get("error_code") != null) { // 토큰 발급 실패 시

					System.out.println("토큰 발급 실패");
					session.setAttribute("alertMsg", "결제 취소가 실패하였습니다. 관리자에게 문의해주세요.");
					mv.setViewName("common/errorPage");
				}

				String receiptId = reserveService.selectPayment(rno).getReceiptId();

				Cancel cancel = new Cancel();
				cancel.receiptId = receiptId;
				cancel.cancelUsername = "관리자";
				cancel.cancelMessage = "예약 취소";

				HashMap<String, Object> res = bootpay.receiptCancel(cancel);
				if (res.get("error_code") == null) { // 결제 취소 성공
					//payment pay_status 업데이트
					reserveService.updatePayment(rno);
					
					// 예약 취소 시 회원 등급 자동 변경 - 경미
					int memNo = ((Member) session.getAttribute("loginMember")).getMemNo();
					int sumPrice = reserveService.sumPrice(memNo);
					int upgradeResult = memberService.downGrade(sumPrice, memNo);

					session.setAttribute("alertMsg", "예약이 취소되었습니다.");
					mv.setViewName("redirect:/myReserve.re");
				} else { // 결제 취소 실패
					session.setAttribute("alertMsg", "결제 취소가 실패하였습니다. 관리자에게 문의해주세요.");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				e.printStackTrace();
				session.setAttribute("alertMsg", "결제 취소가 실패하였습니다. 관리자에게 문의해주세요.");
				mv.setViewName("common/errorPage");
			}

		}
		return mv;
	}

	// 예약 신고
	@RequestMapping("reportMyReserve.re")
	public String reportMyReserve(int rno, String reportType, String reportContent, HttpSession session, Model model) {

		// 일단 신고자번호, 신고당한사람번호 가져오기

		Space s = reserveService.reportMemberInfo(rno);

		s.setHourPrice(rno); // 임시로 형 맞는 hourPrice 에 rno 넣기
		s.setAddressDefault(reportType); // 임시
		s.setAddressDetail(reportContent); // 임시

		// System.out.println(s);

		// 가져온 정보로 insert 하기
		int result = reserveService.insertReportMyReserve(s);

		if (result > 0) { // 신고 insert 성공
			session.setAttribute("alertMsg", "신고가 접수되었습니다.");
			;
		}
		return "redirect:/myReserve.re";
	}

	// 예약 현황 가져오기
	@ResponseBody
	@RequestMapping("getReserveTime.re")
	public ArrayList<Reserve> selectReserveTime(int spaceNo) {

		ArrayList<Reserve> r = reserveService.selectReserveTime(spaceNo);

		// System.out.println(r);

		return r;
	}

	// 결제하기
	@RequestMapping("payUpdate.do")
	public String payUpdate(String reserveCount, String useDate, int startTime, String endTime, int price, String memNo,
			int spaceNo, String rId, String rUrl, String payMethod, HttpSession session) {

		Reserve r = new Reserve();

		int newReserveCount = Integer.parseInt(reserveCount);
		int newEndTime = Integer.parseInt(endTime);

		r.setReserveCount(newReserveCount);
		r.setUseDate(useDate);
		r.setStartTime(startTime);
		r.setEndTime(newEndTime);
		r.setPrice(price);
		r.setMemNo(memNo);
		r.setSpaceNo(spaceNo);

		int reserveResult = reserveService.insertReserve(r);

		// System.out.println(reserveResult);

		Payment p = new Payment();

		p.setReceiptId(rId);
		p.setReceiptUrl(rUrl);
		p.setPayMethod(payMethod);

		int payResult = reserveService.insertPay(p);

		if ((payResult > 0) && (reserveResult > 0)) { // insert 성공

			// 결제 영수증 보내는 메일 서비스 - 경미
			String email = ((Member) session.getAttribute("loginMember")).getEmail();
			mailService.reserveEmail(email, rUrl);

			// 회원 등급 자동 변경 - 경미
			int sumPrice = reserveService.sumPrice(Integer.parseInt(memNo));
			int upgradeResult = memberService.updateGrade(sumPrice, Integer.parseInt(memNo));

			if (upgradeResult > 0) {
				session.setAttribute("alertMsg", "축하드립니다! 이번 예약으로 회원 등급이 상향되었습니다. 스페이스타임과 함께 해주셔서 감사드립니다 :)");
			} else {
				session.setAttribute("alertMsg", "결제에 성공했습니다.");
			}

		} else {
			session.setAttribute("alertMsg", "결제에 실패했습니다. 관리자에게 문의해주세요.");
		}

		return "redirect:/detail.sp?sno=" + spaceNo;
	}

}
