package com.pickmeup.jobstartup.qna.service;

import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.qna.dto.AnswerDTO;
import com.pickmeup.jobstartup.qna.dto.AnswerFileDTO;
import com.pickmeup.jobstartup.qna.dto.QuestionDTO;
import com.pickmeup.jobstartup.qna.dto.QuestionFileDTO;
import org.springframework.web.multipart.MultipartFile;

public interface QnAService {
    //문의글 입력
    public void write(QuestionDTO questionDTO, MultipartFile[] multipartFiles) throws Exception;
    
    //전체 목록 - 관리자 및 개인
    public PagingResponse<QuestionDTO> getList(long memberNo, Criteria criteria) throws Exception;

    //전체 목록 - 기업
    public PagingResponse<QuestionDTO> getCompanyQnAList(long companyNo, Criteria criteria) throws Exception;
    
    public void answerWrite(AnswerDTO answerDTO, MultipartFile[] multipartFiles) throws Exception;

    public QuestionDTO getQuestion(long qNo) throws Exception;

    public void modifyQuestion(QuestionDTO questionDTO, MultipartFile[] multipartFiles) throws Exception;

    public void modifyQuestion(QuestionDTO questionDTO, MultipartFile[] multipartFiles, long[] preFileNo) throws Exception;

    public void delete(long qNo) throws Exception;

    public AnswerDTO detailAnswer(long qNo) throws Exception;

    public void modifyAnswer(AnswerDTO answerDTO, MultipartFile[] multipartFiles) throws Exception;

    public void modifyAnswer(AnswerDTO answerDTO, MultipartFile[] multipartFiles, long[] preFileNo) throws Exception;

    public void deleteAnswer(long aNo) throws Exception;

    public QuestionFileDTO getQuestionFile(long qFile_no) throws Exception;

    public AnswerFileDTO getAnswerFile(long aFile_no) throws Exception;
    
}
