package com.kh.spacetime.space.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
import com.kh.spacetime.common.template.Pagination;
import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.space.model.service.SpaceService;
import com.kh.spacetime.space.model.vo.Bookmark;
import com.kh.spacetime.space.model.vo.Review;
import com.kh.spacetime.space.model.vo.Space;
import com.kh.spacetime.space.model.vo.SpaceAttachment;
import com.kh.spacetime.space.model.vo.SpaceType;

@Controller
public class SpaceController {

	@Autowired
	private SpaceService spaceService;

	/**
	 * 호스트 공간 등록 폼
	 * 
	 * @author 정현
	 */
	@RequestMapping("enrollForm.sp")
	public String spaceEnrollForm(Model model) {
		ArrayList<SpaceType> stypeList = spaceService.selectSpaceTypeList();

		model.addAttribute("stypeList", stypeList);
		return "space/spaceEnrollForm";
	}

	/**
	 * 공간 등록
	 * 
	 * @author 정현
	 */
	@RequestMapping("insert.sp")
	public ModelAndView insertSpace(Space s, MultipartFile[] upfile, HttpSession session, ModelAndView mv) {
		int result = spaceService.insertSpace(s);

		// 내가 추가한 공간 마지막 번호 가져오기
		int spaceNo = spaceService.selectSpaceNo(Integer.parseInt(s.getHostNo()));

//		ArrayList<SpaceAttachment> attachList = new ArrayList<SpaceAttachment>();
		List<SpaceAttachment> attachList = new ArrayList<SpaceAttachment>();

		for (int i = 0; i < upfile.length; i++) {
			if (!upfile[i].getOriginalFilename().equals("")) {

				String changeName = saveFile(upfile[i], session, "space/space/");

				SpaceAttachment at = new SpaceAttachment();
				at.setAttachmentReName("resources/uploadFiles/space/space/" + changeName);
				if (i == 0) {
					at.setAttachmentLevel(1);
				} else {
					at.setAttachmentLevel(2);
				}
				at.setSpaceNo(spaceNo);
				attachList.add(at);
			}
		}
		int result2 = 1;
		if (attachList.size() != 0) {
			result2 = spaceService.insertSpaceAttachment(attachList);
		}

		if (result > 0 && result2 > 0) {
			session.setAttribute("alertMsg", "공간 검수 신청을  완료하였습니다.");
			mv.setViewName("redirect:/hostSpaceList.sp");
		} else {
			mv.addObject("errorMsg", "공간 등록 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	/**
	 * 공간 수정 - 재검수신청
	 * 
	 * @author 정현
	 */
	@RequestMapping("update.sp")
	public ModelAndView updatetSpace(Space s, int mainChg, String thumChg, MultipartFile[] upfile, HttpSession session,
			ModelAndView mv) {
		System.out.println(s);
		System.out.println(mainChg);
		System.out.println(thumChg);
		int result = spaceService.updateSpace(s);

		// 기존 첨부파일 리스트 가져오기
		ArrayList<SpaceAttachment> aList = spaceService.selectSpaceAttachmentList(s.getSpaceNo());
//		List<SpaceAttachment> attachList = new ArrayList<SpaceAttachment>();

		// 대표이미지 변경시기존 대표이미지 삭제 및 업데이트
		SpaceAttachment mainAttach = null;

		// 메인 이미지 변경
		int result2 = 1;
		if (mainChg == 1) {
			mainAttach = aList.get(0);
			String realPath = session.getServletContext().getRealPath(aList.get(0).getAttachmentReName());
			new File(realPath).delete();

			String changeName = saveFile(upfile[0], session, "space/space/");
			mainAttach.setAttachmentReName("resources/uploadFiles/space/space/" + changeName);
			result2 = spaceService.updateMainImg(mainAttach);
		}
		// 수정 이미지 내역 확인
		String[] thum = thumChg.split(",");
		System.out.println("추가 이미지 수정 여부 : " + Arrays.toString(thum));

		int result3 = 1;
		for (int i = 1; i < aList.size(); i++) {
			// 기존 추가이미지 삭제
			if (Integer.parseInt(thum[i - 1]) != 0) {
				String realPath = session.getServletContext().getRealPath(aList.get(i).getAttachmentReName());
				new File(realPath).delete();

				result3 *= spaceService.deleteThumImg(aList.get(i).getAttachmentNo());
			}
		}

		// 기존 이미지 삭제 여부 상관없이 추가 이미지 upfile 체크해서 추가하면 된다.
		List<SpaceAttachment> attachList = new ArrayList<SpaceAttachment>();
		for (int i = 1; i < upfile.length; i++) {

			if (!upfile[i].getOriginalFilename().equals("")) {

				String changeName = saveFile(upfile[i], session, "space/space/");

				SpaceAttachment at = new SpaceAttachment();
				at.setAttachmentReName("resources/uploadFiles/space/space/" + changeName);
				at.setAttachmentLevel(2);
				at.setSpaceNo(s.getSpaceNo());
				attachList.add(at);
			}
		}
		System.out.println("추가리스트 :" + attachList);
		int result4 = 1;
		if (attachList.size() != 0) {
			result4 = spaceService.insertSpaceAttachment(attachList);
		}
		if (result > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			session.setAttribute("alertMsg", "공간 검수 신청을  완료하였습니다.");
			mv.setViewName("redirect:/hostSpaceList.sp");
		} else {
			mv.addObject("errorMsg", "공간 등록 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	/**
	 * 공간 재검수신청 -이미 수정후 버튼을 통해 신청
	 * 
	 * @author 정현
	 */
	@RequestMapping("spaceReInsert.sp")
	public ModelAndView reInsertSpace(int spaceNo, HttpSession session, ModelAndView mv) {
		int result = spaceService.reInsertSpace(spaceNo);

		if (result > 0) {
			session.setAttribute("alertMsg", "공간 재검수 신청을  완료하였습니다.");
			mv.setViewName("redirect:/hostSpaceList.sp");
		} else {
			mv.addObject("errorMsg", "공간 재검수 등록 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	/**
	 * @author 정현 호스트 공간 관리 리스트
	 */
	@RequestMapping("hostSpaceList.sp")
	public String selectHostSpaceList(@RequestParam(value = "spage", defaultValue = "1") int currentPage,
			HttpSession session, Model model) {

		Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();

		int listCount = spaceService.selectHostSpaceListCount(memNo);
		int pageLimit = 5;
		int boardLimit = 3;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Space> spaceList = spaceService.selectHostSpaceList(memNo, pi);

		// 첨부파일 rename 문자열 리스트
		ArrayList<String> imgStrList = new ArrayList<String>();

		for (Space s : spaceList) {
			ArrayList<SpaceAttachment> aList = spaceService.selectSpaceAttachmentList(s.getSpaceNo());
			s.setSpaceSubTitle(aList.get(0).getAttachmentReName());

			String imgStr = "";
			for (int i = 0; i < aList.size(); i++) {
				if (i == aList.size() - 1) {
					imgStr += aList.get(i).getAttachmentReName();
				} else {
					imgStr += aList.get(i).getAttachmentReName() + ",";
				}
			}
			imgStrList.add(imgStr);
		}
		model.addAttribute("pi", pi);
		model.addAttribute("spaceList", spaceList);
		model.addAttribute("imgStrList", imgStrList);

		return "space/hostSpaceList";
	}

	/**
	 * 호스트 공간 수정 폼
	 * 
	 * @author 정현
	 */
	@RequestMapping("spaceUpdateForm.sp")
	public String spaceUpdateForm(int spaceNo, Model model) {
		Space s = spaceService.selectSpace(spaceNo);
		ArrayList<SpaceType> stypeList = spaceService.selectSpaceTypeList();
		ArrayList<SpaceAttachment> aList = spaceService.selectSpaceAttachmentList(spaceNo);

		model.addAttribute("stypeList", stypeList);
		model.addAttribute("s", s);
		model.addAttribute("aList", aList);
		return "space/spaceUpdateForm";
	}

	/**
	 * @author 정현 공간 삭제
	 */
	@RequestMapping("spaceDel.sp")
	public String deleteSpace(int spaceNo, HttpSession session, Model model) {
		int result = spaceService.deleteSpace(spaceNo);

		if (result > 0) {
			ArrayList<SpaceAttachment> aList = spaceService.selectSpaceAttachmentList(spaceNo);

			// 공간에대한 모든 첨부파일 삭제
			for (SpaceAttachment a : aList) {
				String realPath = session.getServletContext().getRealPath(a.getAttachmentReName());
				System.out.println(realPath);
				new File(realPath).delete();
			}
			int result2 = spaceService.deleteSpaceAttachment(spaceNo);
			if (result2 > 0) {
				session.setAttribute("alertMsg", "공간이 삭제되었습니다.");
				return "redirect:/hostSpaceList.sp";
			} else {
				model.addAttribute("errorMsg", "공간 첨부파일 삭제 실패");
				return "common/errorPage";
			}
		} else { // 게시글 삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}

	// 지도화면으로 이동 -성훈
	@RequestMapping("searchSpaceList.mp")
	public ModelAndView selectSpaceList(String pureKeyword, ModelAndView mv) {
		mv.addObject("pureKeyword", pureKeyword).setViewName("space/searchSpace");
		return mv;
	}
	
	// 메인화면에서 카테고리 선택으로 지도 이동 -성훈
	@RequestMapping("searchSpaceByCategory.mp")
	public ModelAndView searchSpaceByCategory(String categoryNo, ModelAndView mv) {
		mv.addObject("categoryNo", categoryNo).setViewName("space/searchSpace");
		return mv;
	}

	// 지도 필터링(지역설정O) -성훈
	@ResponseBody
	@RequestMapping(value = "mapFilter.mp", produces = "application/json; charset=UTF-8")
	public String filterListForMap(HttpServletRequest request, String min_price, String max_price) {
		String[] category = request.getParameterValues("category[]");
		ArrayList<String> categoryArr = new ArrayList<>();
		for (int i = 0; i < category.length; i++) {
			categoryArr.add(category[i]);
		}

		String[] area = request.getParameterValues("area[]");
		ArrayList<String> areaArr = new ArrayList<>();
		for (int i = 0; i < area.length; i++) {
			areaArr.add(area[i]);
		}

		HashMap<String, Object> condition = new HashMap<>();
		condition.put("area", areaArr);
		condition.put("category", categoryArr);
		condition.put("min_price", min_price);
		condition.put("max_price", max_price);
		ArrayList<Space> listArr = spaceService.filterListForMap(condition);

		return new Gson().toJson(listArr);
	}

	// 지도 필터링(지역설정X => 현재 보여지는 지도) -성훈
	@ResponseBody
	@RequestMapping(value = "mapFilterOnCurrentMap.mp", produces = "application/json; charset=UTF-8")
	public String mapFilterOnCurrentMap(double max_lat, double max_lng, double min_lat, double min_lng,
			HttpServletRequest request, String min_price, String max_price) {
		String[] category = request.getParameterValues("category[]");
		ArrayList<String> categoryArr = new ArrayList<>();
		for (int i = 0; i < category.length; i++) {
			categoryArr.add(category[i]);
		}

		HashMap<String, Double> bound = new HashMap<>();
		bound.put("max_lat", max_lat);
		bound.put("max_lng", max_lng);
		bound.put("min_lat", min_lat);
		bound.put("min_lng", min_lng);

		HashMap<String, Object> condition = new HashMap<>();
		condition.put("bound", bound);
		condition.put("category", categoryArr);
		condition.put("min_price", min_price);
		condition.put("max_price", max_price);

		ArrayList<Space> listArr = spaceService.mapFilterOnCurrentMap(condition);

		return new Gson().toJson(listArr);
	}

	// 해시태그 검색 -성훈
	@ResponseBody
	@RequestMapping(value = "searchSpaceByHashtag.mp", produces = "application/json; charset=UTF-8")
	public String searchSpaceByHashtag(String pureKeyword) {
		String keyword = pureKeyword.replace("#", "");
		System.out.println(pureKeyword);
		ArrayList<Space> listArr = spaceService.searchSpaceByHashtag(keyword);

		return new Gson().toJson(listArr);
	}

	// 일반검색 -성훈
	@ResponseBody
	@RequestMapping(value = "searchSpaceByKeyword.mp", produces = "application/json; charset=UTF-8")
	public String searchSpaceByKeyword(String keyword) {
		ArrayList<Space> listArr = spaceService.searchSpaceByKeyword(keyword);

		return new Gson().toJson(listArr);
	}





	// 현재 넘어온 첨부파일 그 자체를 수정명으로 서버의 폴더에 저장시키는 메소드 (일반메소드)
	// => Spring 의 Controller 메소드는 반드시 요청을 처리하는 역할이 아니여도 된다!!
	/**
	 * @author 정현 함수 호출시 route에 본인 업파일 경로 넣으면됨
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

	/**
	 * @author 하연 공간 상세페이지 ^___^
	 */

	@RequestMapping("reportSpace.sp")
	public ModelAndView insertSpaceReport(int sno, String reportType, @RequestParam(value="reportContent", required=false, defaultValue=" ")String reportContent, HttpSession session,
			ModelAndView mv) {

		int mno = ((Member) session.getAttribute("loginMember")).getMemNo();

		Space sHostNo = spaceService.selectSpaceDetail(sno);

		Space s = new Space();
		s.setSpaceNo(sno);
		s.setMaxPeople(mno); // 임시 - 신고한 회원번호
		s.setHostNo(sHostNo.getHostNo());
		s.setAddressDefault(reportType); // 임시 - 리포트 타입
		s.setAddressDetail(reportContent); // 임시 - 리포트 내용

		int result = spaceService.insertSpaceReport(s);

		if (result > 0) { // 신고 insert 성공
			session.setAttribute("alertMsg", "신고가 접수되었습니다.");

		}

		mv.addObject("s", s);

//		mv.setViewName("space/spaceDetailView");
		mv.setViewName("redirect:/detail.sp?sno="+sno);

		return mv;

	}

	// 공간 상세조회 - 북마크 기능
	@RequestMapping(value = "detail.sp", produces = "text/html; charset=UTF-8")
	public ModelAndView selectProduct(int sno, ModelAndView mv, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		if(loginMember != null && loginMember.getMemNo() == 1) {

			Bookmark bm = new Bookmark();

			int count = 0;

			if (session.getAttribute("loginMember") != null) {

				int memNo = ((Member) session.getAttribute("loginMember")).getMemNo();
//				System.out.println(sno);
//				System.out.println(memNo);

				bm.setBookmarkMem(memNo);
				bm.setBookmarkSpace(sno);

				// System.out.println(bm);

				count = spaceService.selectSpaceLike(bm);
				// System.out.println("selectSpaceLike" + bm);
			}

			Member m = (Member) session.getAttribute("loginMember");
			

			// 상세조회 요청
			// DetailView.jsp 상에 필요한 데이터 조회
			Space s = spaceService.selectSpaceDetail(sno);
			ArrayList<SpaceAttachment> sa = spaceService.selectSpaceDetailAttachment(sno);

			// 정현
			int listCount = spaceService.selectReviewListBySnoCount(sno);
			int pageLimit = 5;
			int boardLimit = 10;

			PageInfo pi = Pagination.getPageInfo(listCount, 1, pageLimit, boardLimit);

			HashMap<String, Integer> map = new HashMap<>();

			map.put("spaceNo", sno);
			if (m == null) {
				map.put("memNo", null);
			} else {
				map.put("memNo", m.getMemNo());
			}

			ArrayList<Review> reviewList = spaceService.selectReviewListBySno(map, pi);
			mv.addObject("rList", reviewList);
			mv.addObject("pi", pi);

			// 조회된 데이터를 담아서 포워딩
			mv.addObject("count", count);
			mv.addObject("s", s);
			mv.addObject("sa", sa);
			mv.addObject("bm", bm);
			mv.setViewName("space/spaceDetailView");
			
		}
		else {
			// 게시글 조회수 증가용 서비스 호출 결과 받기 (update 하고 오기)
			int result = spaceService.increaseCount(sno);

			Bookmark bm = new Bookmark();

			int count = 0;

			if (session.getAttribute("loginMember") != null) {

				int memNo = ((Member) session.getAttribute("loginMember")).getMemNo();
//				System.out.println(sno);
//				System.out.println(memNo);

				bm.setBookmarkMem(memNo);
				bm.setBookmarkSpace(sno);

				// System.out.println(bm);

				count = spaceService.selectSpaceLike(bm);
				// System.out.println("selectSpaceLike" + bm);
			}

			Member m = (Member) session.getAttribute("loginMember");
			
			if (result > 0) { // 성공적으로 조회수 증가가 일어났다면

				// 상세조회 요청
				// DetailView.jsp 상에 필요한 데이터 조회
				Space s = spaceService.selectSpaceDetail(sno);
				ArrayList<SpaceAttachment> sa = spaceService.selectSpaceDetailAttachment(sno);

				// 정현
				int listCount = spaceService.selectReviewListBySnoCount(sno);
				int pageLimit = 5;
				int boardLimit = 10;

				PageInfo pi = Pagination.getPageInfo(listCount, 1, pageLimit, boardLimit);

				HashMap<String, Integer> map = new HashMap<>();

				map.put("spaceNo", sno);
				if (m == null) {
					map.put("memNo", null);
				} else {
					map.put("memNo", m.getMemNo());
				}

				ArrayList<Review> reviewList = spaceService.selectReviewListBySno(map, pi);
				mv.addObject("rList", reviewList);
				mv.addObject("pi", pi);

				// 조회된 데이터를 담아서 포워딩
				mv.addObject("count", count);
				mv.addObject("s", s);
				mv.addObject("sa", sa);
				mv.addObject("bm", bm);
				mv.setViewName("space/spaceDetailView");

				// System.out.println(s);

			} else { // 실패
				mv.setViewName("common/errorPage404");
			}
		}
		return mv;
	}

	@ResponseBody
	@RequestMapping("like.sp")
	public int spaceLike(int spaceNo, int memNo) {

		Bookmark bm = new Bookmark();
		bm.setBookmarkMem(memNo);
		bm.setBookmarkSpace(spaceNo);
		System.out.println(bm);

		// System.out.println("insert : " + bm);

		int result = spaceService.insertSpaceLike(bm);
		System.out.println(result);

		return result;
	}

	@ResponseBody
	@RequestMapping("deletelike.sp")
	public int spaceUnLike(int spaceNo, int memNo) {

		Bookmark bm = new Bookmark();
		bm.setBookmarkMem(memNo);
		bm.setBookmarkSpace(spaceNo);

		int result = spaceService.deleteSpaceLike(bm);

		return result;
	}

	/**
	 * 관리자 공간관리 리스트 페이지로 포워딩 - 혜민
	 * 
	 * @return
	 */
	@RequestMapping(value = "splist.ad")
	public String selectAdminSpaceList() {

		return "space/adminSpace";
	}

	/**
	 * 관리자 공간관리 리스트 페이징, 조회 - 혜민
	 * 
	 * @param currentPage
	 * @param model
	 * @param tab
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "ajaxsplist.ad", produces = "application/json; charset=UTF-8")
	public String ajaxSpaceList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
			String tab) {

		HashMap<String, String> map = new HashMap<>();
		map.put("tab", tab);

		int listCount = spaceService.selectAdminSpaceListCount(map);

		// System.out.println("listCount : " + listCount);

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Space> list = spaceService.selectAdminSpaceList(pi, map);

		JSONArray jArr = new JSONArray();
		for (Space s : list) {
			JSONObject jObj = new JSONObject();
			jObj.put("spaceNo", s.getSpaceNo());
			jObj.put("hostNo", s.getHostNo());
			jObj.put("spaceTitle", s.getSpaceTitle());
			jObj.put("spaceStatus", s.getSpaceStatus());
			jObj.put("stypeNo", s.getStypeNo());
			jObj.put("denyMessage", s.getDenyMessage());
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
		json.put("list", jArr); // 0번 인덱스
		json.put("pi", jObj); // 1번 인덱스

		// System.out.println(json);

		return json.toJSONString();
	}

	/**
	 * 관리자 공간처리 메소드 - 혜민
	 * 
	 * @param s
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("updateAdminSpace.ad")
	public String updateAdminSpace(Space s, Model model, HttpSession session) {

		// System.out.println("컨트롤러까지 왔나?");

		HashMap<String, String> map = new HashMap<>();

		String spaceNo = Integer.toString(s.getSpaceNo());

		map.put("spaceNo", spaceNo);

		// System.out.println(spaceNo);
		// System.out.println(s.getSpaceStatus());
		// System.out.println(s.getDenyMessage());

		if (s.getSpaceStatus() != null) {
			map.put("spaceStatus", s.getSpaceStatus());
			map.put("denyMessage", s.getDenyMessage());
		}

		// System.out.println(map);

		int result = spaceService.updateAdminSpace(map);

		if (result > 0) { // 공간 처리 성공

			session.setAttribute("alertMsg", "처리가 완료되었습니다.");
			return "redirect:/splist.ad";

		} else { // 공간 처리 실패

			model.addAttribute("errorMsg", "처리 실패");
			return "common/errorPage";
		}
	}

	/**
	 * 관리자 공간 검색 - 혜민
	 * 
	 * @param currentPage
	 * @param model
	 * @param condition
	 * @param keyword
	 * @return
	 */
	@RequestMapping("searchSp.ad")
	public String selectSpaceSearchList(@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			Model model, String condition, String keyword) {

		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		int listCount = spaceService.selectSpaceSearchListCount(map);

		int pageLimit = 5;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Space> list = spaceService.selectSpaceSearchList(pi, map);

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		// System.out.println(pi);
		// System.out.println(list);

		return "space/adminSpaceSearch";
	}

	/**
	 * @author 희섭 마이페이지 북마크
	 */
	@RequestMapping("mypagebookmark.sp")
	public String selectmypagebookmark(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model,
			HttpSession session) {

		// System.out.println("cpage : " + currentPage);
		// int reportMemNo= ((Member)Session.getAttribute("loginMember")).getMemNo() ;
		Member m = (Member) session.getAttribute("loginMember");
		int MemNo = m.getMemNo();

		int listCount = spaceService.selectmypagebookmarkListCount(MemNo);

		int pageLimit = 10; // 페이지바 버튼갯수
		int boardLimit = 9; // 한 페이지 게시글 갯수

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		ArrayList<Space> list = spaceService.selectmypagebookmarkList(MemNo, pi);
		System.out.println(list);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);

		return "space/mypageBookMark";
	}

}
