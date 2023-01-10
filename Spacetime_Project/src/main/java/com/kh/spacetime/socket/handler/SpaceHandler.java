package com.kh.spacetime.socket.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.kh.spacetime.member.model.vo.Member;
import com.kh.spacetime.socket.handler.domain.Message;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SpaceHandler extends TextWebSocketHandler {

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();

	/* websocket 연결 성공 시 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

//		log.info("Socket  연결");

		sessionList.add(session);
		String sender = curUserId(session);

//		log.info("{} 접속", sender);
		userSessionsMap.put(sender, session);

	}

	/* websocket 연결 종료 시 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

//		log.info("Socket 끊음");
		sessionList.remove(session);
		userSessionsMap.remove(curUserId(session), session);

	}

	/* websocket 메시지 수신 및 송신 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		Gson gson = new Gson();
		// json으로부터 객체를 만듦 //이 message클래스를 기반으로 json이만들어진다.
		Message msg = gson.fromJson(message.getPayload(), Message.class);
		// ↑ json을 java의 객체로 바꿔주는 것.

		// 전달 메시지
		TextMessage sendMsg = new TextMessage(gson.toJson(msg));

		if (msg != null) {

			WebSocketSession receiverSession = userSessionsMap.get(msg.getReceiverId());

			Member m = new Member();
			// 공간 예약완료 시
			if ("reserve".equals(msg.getMsgType()) && receiverSession != null) {
				receiverSession.sendMessage(sendMsg);
			}
			// 이용후기 작성 시
			else if ("review".equals(msg.getMsgType()) && receiverSession != null) {
				receiverSession.sendMessage(sendMsg);
			}
			// 챗 작성 시
			else if ("chat".equals(msg.getMsgType()) && receiverSession != null) {
				receiverSession.sendMessage(sendMsg);
			}
			// 관리자 검수 업데이트
			else if ("spStatusUpdate".equals(msg.getMsgType()) && receiverSession != null) {
				receiverSession.sendMessage(sendMsg);
			}
			// 호스트 예약 확정
			else if ("revconfirm".equals(msg.getMsgType()) && receiverSession != null) {
				receiverSession.sendMessage(sendMsg);
			}
			// 호스트 예약 취소
			else if ("revreject".equals(msg.getMsgType()) && receiverSession != null) {
				receiverSession.sendMessage(sendMsg);
			}
		}
	}

	// 웹소켓 보낸사람 userId 가져오기
	private String curUserId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member) httpSession.get("loginMember");

		if (loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getMemId();
		}
	}

}
