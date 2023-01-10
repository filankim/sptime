package com.kh.spacetime.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spacetime.board.model.service.NewsletterService;
import com.kh.spacetime.board.model.vo.Newsletter;
import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.space.model.service.SpaceService;
import com.kh.spacetime.space.model.vo.Space;

@Controller
public class NewsletterController {
  
	@Autowired
	private NewsletterService newsletterService;
	
	@Autowired
	private SpaceService spaceService;
	
	
	/**
	 * 뉴스레터 리스트 - 경미
	 * @param model
	 * @return
	 */
	@RequestMapping("list.ne")
	public String newsletterList(Model model) {
		
		ArrayList<Newsletter> list = newsletterService.selectList();
		model.addAttribute("list", list);
		
		return "board/newsletterListView";
	}
	
	/**
	 * 뉴스레터 상세 조회 - 경미
	 * @param nlno
	 * @param mv
	 * @return
	 */
	@RequestMapping("detail.ne")
	public ModelAndView selectNewsletter(@RequestParam(value = "nlno")int nlno, ModelAndView mv, HttpSession session) {
			
		Newsletter n = newsletterService.selectNewsletter(nlno);
		
		int memNo = 0;
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		HashMap map = new HashMap();
		
		if(loginMember != null) {
			memNo = loginMember.getMemNo();
		}
		map.put("memNo", memNo);
		
		if(n != null) {
			
			String[] arr = n.getNewsKeyword().split(",");
			List<String> list = new ArrayList<String>();
			
			for(int i=0; i<arr.length; i++) {
				list.add(arr[i]);
			}
			
			map.put("list", list);
			
			ArrayList<Space> spaceList = spaceService.selectListForNewsletter(map);
			
			mv.addObject("n", n);
			mv.addObject("list", spaceList);
			mv.setViewName("board/newsletterDetailView");
		}
		else { // 실패
			
			mv.addObject("errorMsg", "뉴스레터 상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	/**
	 * 뉴스레터 작성 페이지를 띄워주는 메소드 - 경미
	 * @return
	 */
	@RequestMapping("insertForm.ne")
	public String insertForm() {

		return "board/newsletterInsertForm";
	}
	
	@RequestMapping("insert.ne")
	public String insertNewsletter(Newsletter n, String[] keyword, MultipartFile upfile, HttpSession session, Model model) {
		
		String newsKeyword = String.join(",", keyword);
		n.setNewsKeyword(newsKeyword);
		
		// n 객체에 새로 넘어온 첨부파일에 대한 수정파일명 필드에 담기
		n.setNewsThumbnail("resources/uploadFiles/board/newsletter/" + saveFile(upfile, session));
		
		int result = newsletterService.insertNewsletter(n);
		
		if(result > 0) { // 게시글 작성 성공
			
			session.setAttribute("alertMsg", "성공적으로 뉴스레터가 작성되었습니다.");
			
			return "redirect:/list.ne";
		}
		else { // 게시글 작성 실패
			
			model.addAttribute("errorMsg", "뉴스레터 작성 실패");
			
			return "common/errorPage";
		}
	}
	
	/**
	 * 뉴스레터 수정 페이지를 띄워주는 메소드 - 경미
	 * @param nlno
	 * @param model
	 * @return
	 */
	@RequestMapping("updateForm.ne")
	public String updateForm(@RequestParam(value = "nlno")int nlno, Model model) {
		
		Newsletter n = newsletterService.selectNewsletter(nlno);
		
		model.addAttribute("n", n);
		
		return "board/newsletterUpdateForm";
	}
	
	/**
	 * 
	 * @param n
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("update.ne")
	public String updateNewsletter(Newsletter n, String[] keyword, MultipartFile reupfile, HttpSession session, Model model) {
		
		String newsKeyword = String.join(",", keyword);
		n.setNewsKeyword(newsKeyword);
		
		// 새로 넘어온 첨부파일이 있는 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 1. 기존 첨부파일이 있었을 경우 => 기존 첨부파일을 찾아서 삭제
			if(n.getNewsThumbnail() != null) {
				String realPath = session.getServletContext().getRealPath(n.getNewsThumbnail());
				new File(realPath).delete();
			}
			
			// 2. 새로 넘어온 첨부파일을 수정명으로 바꾸고 서버에 업로드 시키기
			String changeName = saveFile(reupfile, session);
			
			// 3. n 객체에 새로 넘어온 첨부파일에 대한 수정파일명 필드에 담기
			n.setNewsThumbnail("resources/uploadFiles/board/newsletter/" + changeName);
		}
		
		int result = newsletterService.updateNewsletter(n);
		
		if(result > 0) { // 게시글 수정 성공
			
			session.setAttribute("alertMsg", "성공적으로 뉴스레터가 수정되었습니다.");
			
			return "redirect:/detail.ne?nlno="+n.getNewsNo();
			
		}
		else { // 게시글 수정 실패
			
			model.addAttribute("errorMsg", "뉴스레터 수정 실패");
			
			return "common/errorPage";
		}
		
	}
	
	/**
	 * 뉴스레터 썸네일 사진 업로드용 메소드 - 경미
	 * @param upfile
	 * @param session
	 * @return
	 */
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		// 1. 원본파일명 뽑아오기
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		// 2. 시간 형식을 문자열로 뽑아내기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20221122104050"
		
		// 3. 뒤에 붙을 5자리 랜덤값 뽑기
		int ranNum = (int)(Math.random() * 90000) + 10000; // 5자리 랜덤값
		
		// 4. 원본파일로부터 확장자만 뽑기
		String ext = originName.substring(originName.lastIndexOf(".")); // ".png"
		
		// 5. 모두 이어 붙이기
		String changeName = currentTime + ranNum + ext;
		
		// 6. 업로드 하고자 하는 서버의 물리적인 실제 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/board/newsletter/");
		
		// 7. 경로와 수정파일명을 합체 후 파일을 업로드해주기
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	/**
	 * 뉴스레터 삭제 - 경미
	 * @param newsNo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("delete.ne")
	public String deleteNotice(int newsNo, String newsThumbnail, HttpSession session, Model model) {
		
		int result = newsletterService.deleteNewsletter(newsNo);
		
		if(result > 0) { // 게시글 삭제 성공
			
			// 파일 삭제
			String realPath = session.getServletContext().getRealPath(newsThumbnail);
			new File(realPath).delete();
			
			session.setAttribute("alertMsg", "성공적으로 뉴스레터 게시글이 삭제되었습니다.");
			return "redirect:/list.ne";
		}
		else { // 게시글 삭제 실패
			
			model.addAttribute("errorMsg", "뉴스레터 게시글 삭제 실패");
			return "common/errorPage";
		}
	}
}
