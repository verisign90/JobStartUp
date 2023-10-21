package com.pickmeup.jobstartup.message.service;

import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.Pagination;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.message.dto.MessageDTO;
import com.pickmeup.jobstartup.message.repository.MessageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService{

    private final MessageRepository messageRepository;

    @Override
    @Transactional
    public void sendMessage(MessageDTO messageDTO) throws Exception {
        messageRepository.insertMessage(messageDTO);
    }

    @Override
    public PagingResponse<MessageDTO> getMessageList(long memberNo, Criteria criteria) throws Exception {
        int currentPageNo = criteria.getCurrentPageNo();
        int messageCnt = Integer.parseInt(messageRepository.countAllMessage(memberNo));
        if (messageCnt < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }
        //Paging 정보를 criteria에 저장
        criteria.setRecordsPerPage(6);
        criteria.setPageSize(1);
        Pagination pagination = new Pagination(messageCnt, criteria);
        criteria.setPagination(pagination);
        criteria.setCurrentPageNo(currentPageNo);
        List<MessageDTO> list = messageRepository.selectMessageList(memberNo, criteria);
        return new PagingResponse<>(list, pagination);
    }

    @Override
    public PagingResponse<MessageDTO> messageSentList(long memberNo, Criteria criteria) throws Exception {
        int currentPageNo = criteria.getCurrentPageNo();
        System.out.println("memberNo : "+memberNo);
        int messageCnt = Integer.parseInt(messageRepository.countSentMessageView(memberNo));
        if (messageCnt < 1) {
            return new PagingResponse<>(Collections.emptyList(), null);
        }
        //Paging 정보를 criteria에 저장
        criteria.setRecordsPerPage(6);
        criteria.setPageSize(1);
        Pagination pagination = new Pagination(messageCnt, criteria);
        criteria.setPagination(pagination);
        criteria.setCurrentPageNo(currentPageNo);
        List<MessageDTO> list = messageRepository.selectSentMessageList(memberNo, criteria);
        return new PagingResponse<>(list, pagination);
    }


    @Override
    @Transactional
    public MessageDTO readMessage(long mesNo) throws Exception {
        //메세지 확인
        MessageDTO messageDTO = messageRepository.selectMessageByNo(mesNo);
        //수신 확인
        if(messageDTO.getMes_read().equals("N")) {
            messageRepository.updateRead(mesNo);
            messageDTO.setMes_read("Y");
        }
        return messageDTO;
    }

    @Override
    public MessageDTO readSentMessage(long mesNo) throws Exception {
        //메세지 확인
        MessageDTO messageDTO = messageRepository.selectSentMessageByNo(mesNo);
        //수신 확인
        if(messageDTO.getMes_read().equals("N")) {
            messageRepository.updateRead(mesNo);
            messageDTO.setMes_read("Y");
        }
        return messageDTO;
    }

    @Transactional
    @Override
    public void deleteMessage(Long mesReceiver, List<String> selectedValues) throws Exception {
        long mesNo = 0;
        if(selectedValues!=null || !selectedValues.isEmpty()){
            for(String strNo : selectedValues){
                try {
                    mesNo = Long.parseLong(strNo);
                } catch (NumberFormatException e) {
                    System.out.println(strNo + " is not a valid number");
                }
                messageRepository.updateDeleteYN(mesReceiver, mesNo);
            }
        }
    }

    @Override
    public void deleteSentMessage(Long mesSender, List<String> selectedValues) throws Exception {
        long mesNo = 0;
        if(selectedValues!=null || !selectedValues.isEmpty()){
            for(String strNo : selectedValues){
                try {
                    mesNo = Long.parseLong(strNo);
                } catch (NumberFormatException e) {
                    System.out.println(strNo + " is not a valid number");
                }
                messageRepository.updateSentDeleteYN(mesSender, mesNo);
            }
        }
    }
}
