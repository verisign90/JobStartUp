package com.pickmeup.jobstartup.message.repository;

import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.message.dto.MessageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface MessageRepository {

    //새 메세지 개수
    public String countMessageView(long memberNo) throws DataAccessException;

    public String countAllMessage(long memberNo) throws DataAccessException;

    //메세지 입력
    public void insertMessage(MessageDTO messageDTO) throws DataAccessException;

    //받은 메세지 목록
    public List<MessageDTO> selectMessageList(@Param("memberNo") long memberNo, @Param("criteria") Criteria criteria) throws DataAccessException;

    //메세지 내용 확인
    public MessageDTO selectMessageByNo(long mesNo) throws DataAccessException;

    //발신 메세지 내용 확인
    public MessageDTO selectSentMessageByNo(long mesNo) throws DataAccessException;

    //메세지 읽음 표시
    public void updateRead(long mesNo) throws DataAccessException;

    public String countSentMessageView(long memberNo) throws DataAccessException;

    public List<MessageDTO> selectSentMessageList(@Param("memberNo") long memberNo,@Param("criteria") Criteria criteria) throws DataAccessException;

    //수신자 메세지 삭제
    public void updateDeleteYN(@Param("mesReceiver") Long mesReceiver, @Param("mesNo") long mesNo) throws DataAccessException;
    
    //발신자
    public void updateSentDeleteYN(@Param("mesSender") Long mesSender, @Param("mesNo") long mesNo) throws DataAccessException;
}
