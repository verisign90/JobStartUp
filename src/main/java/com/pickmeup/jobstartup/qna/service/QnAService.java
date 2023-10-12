package com.pickmeup.jobstartup.qna.service;

import com.pickmeup.jobstartup.qna.dto.QuestionDTO;
import org.springframework.web.multipart.MultipartFile;

public interface QnAService {
    //문의글 입력
    public void write(QuestionDTO questionDTO, MultipartFile[] multipartFiles) throws Exception;
}
