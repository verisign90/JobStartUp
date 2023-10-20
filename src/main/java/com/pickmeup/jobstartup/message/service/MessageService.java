package com.pickmeup.jobstartup.message.service;

import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.message.dto.MessageDTO;

import java.util.List;

public interface MessageService {
    public void sendMessage(MessageDTO messageDTO) throws Exception ;

    public PagingResponse<MessageDTO> getMessageList(long memberNo, Criteria criteria) throws Exception;

    PagingResponse<MessageDTO> messageSentList(long memberNo, Criteria criteria) throws Exception;

    //메세지 수신여부 확인
    public MessageDTO readMessage(long mesNo) throws Exception;
    
    //수신자 메세지 삭제
    public void deleteMessage(Long mesReceiver, List<String> selectedValues) throws Exception;
    
    //발신자 메세지 삭제
    public void deleteSentMessage(Long mesReceiver, List<String> selectedValues) throws Exception;
}
