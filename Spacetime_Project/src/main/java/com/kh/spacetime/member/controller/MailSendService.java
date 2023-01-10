package com.kh.spacetime.member.controller;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;

import com.kh.spacetime.member.model.service.MemberService;
import com.kh.spacetime.member.model.service.MemberServiceImpl;
import com.kh.spacetime.member.controller.MemberController;

@Controller
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNumber; // 난수 발생
	private String authString; // 비밀번호 초기화 임시 비번 생성 
	private MemberController memberController;
	
	/**
	* 난수를 발생시키는 메소드 - 경미
	*/
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);
		authNumber = checkNum;
	}
	
	/**
	* 회원 가입용 이메일 양식 - 경미
	* @param email
	* @return
	*/
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = "final221223@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "[본인인증] '스페이스 타임' 회원 가입 인증 이메일입니다."; // 이메일 제목 
		String content = 
				"안녕하세요!<br> 저희 '스페이스 타임' 홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
				"<br><br>" + 
				"인증 번호는 <b>" + authNumber + "</b>입니다." + 
				"<br>" + 
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	/**
	* 비밀번호 변경용 이메일 양식 - 경미
	* @param email
	* @return
	*/
	public String pwdEmail(String email) {
		makeRandomNumber();
		String setFrom = "final221223@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "[본인인증] '스페이스 타임' 비밀번호 변경을 위한 이메일입니다."; // 이메일 제목 
		String content = 
				"안녕하세요!<br> 저희 '스페이스 타임' 홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
				"<br><br>" + 
				"인증 번호는 <b>" + authNumber + "</b>입니다." + 
				"<br>" + 
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	/**
	 * 결제 영수증 발송 이메일 - 경미
	 * @param email
	 * @param receiptUrl
	 */
	public void reserveEmail(String email, String receiptUrl) {

		String setFrom = "final221223@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "[예약확인] 스페이스타임 예약 확인 및 결제 영수증 이메일입니다."; // 이메일 제목 
		String content = 
				"안녕하세요!<br> 저희 '스페이스 타임' 서비스를 이용해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
				"<br><br>" + 
				"게스트님의 예약 신청은 성공적으로 완료되어 호스트님의 승인을 기다리는 중입니다 :)" + 
				"<br>" + 
				"게스트님의 결제 영수증은 <a href='"+receiptUrl+"'>"+receiptUrl+"</a> 에서 확인하실 수 있습니다!" +
				"<br>감사합니다!"; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
	}
	
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능. 문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

	// 관리자 비밀번호 초기화용 난수 발생 메소드 - 혜민 
	public String makeAdminRandom() {
		
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String authString = "";

		// 문자 배열 길이의 값을 랜덤으로 10개를 뽑아 구문을 작성함
		int idx = 0;
		for (int i = 0; i < 10; i++) {
			idx = (int) (charSet.length * Math.random());
			authString += charSet[idx];
		}
		return authString;
	}
	

	// 비밀번호 초기화 임시 비밀번호 메일 보내기 
	public String adminTempPwdEmail(String email) {
		
		String authString = makeAdminRandom();
		
		String setFrom = "final221223@gmail.com"; // email-config에 설정한 자신의 이메일 주소를 입력 
		String toMail = email;
		String title = "[비밀번호 초기화] '스페이스 타임' 임시 비밀번호 안내 이메일입니다."; // 이메일 제목 
		String content = 
				"안녕하세요!<br> 저희 '스페이스 타임' 홈페이지를 방문해주셔서 감사합니다." + 	//html 형식으로 작성 ! 
				"<br><br>" + 
				"임시 비밀번호는 <b>" + authString + "</b>입니다." + 
				"<br>" + 
				"해당 임시 비밀번호로 로그인 후 비밀번호를 변경해주세요."; //이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		
		// System.out.println("초기화된 비밀번호 : " + authString);
		
		return authString;
	}
		
}
