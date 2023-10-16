package com.pickmeup.jobstartup.qna.service;

import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.qna.dto.AnswerDTO;
import com.pickmeup.jobstartup.qna.dto.QuestionDTO;
import org.springframework.web.multipart.MultipartFile;

public interface QnAService {
    //문의글 입력
    public void write(QuestionDTO questionDTO, MultipartFile[] multipartFiles) throws Exception;

    public PagingResponse<QuestionDTO> getList(Criteria criteria) throws Exception;

    public void answerWrite(AnswerDTO answerDTO, MultipartFile[] multipartFiles) throws Exception;

    public QuestionDTO getQuestion(long qNo) throws Exception;
    public void modifyQuestion(QuestionDTO questionDTO, MultipartFile[] multipartFiles) throws Exception;

    public void modifyQuestion(QuestionDTO questionDTO, MultipartFile[] multipartFiles, long[] preFileNo) throws Exception;

    public void delete(long qNo) throws Exception;

    public AnswerDTO detailAnswer(long qNo) throws Exception;

    public void modifyAnswer(AnswerDTO answerDTO, MultipartFile[] multipartFiles) throws Exception;

    public void modifyAnswer(AnswerDTO answerDTO, MultipartFile[] multipartFiles, long[] preFileNo) throws Exception;
}
