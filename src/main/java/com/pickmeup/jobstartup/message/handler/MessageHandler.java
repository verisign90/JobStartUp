package com.pickmeup.jobstartup.message.handler;

import com.pickmeup.jobstartup.message.repository.MessageRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
@Log4j2
@RequiredArgsConstructor
public class MessageHandler extends TextWebSocketHandler {

    private final MessageRepository messageRepository;

    // message -> websocket을 통해서 받은 메세지를 처리하는 메소드
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.info(message.getPayload());
        session.sendMessage(new TextMessage(messageRepository.countMessageView(Long.parseLong(message.getPayload()))));
    }

    // connection established -> websocket에 session이 접속했을 때, 처리하는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {

    }


    // connection closed -> websocket에 session이 접속을 해제 했을 때, 처리하는 메소드
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

    }
}
