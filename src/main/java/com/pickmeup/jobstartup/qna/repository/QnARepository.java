package com.pickmeup.jobstartup.qna.repository;

import com.pickmeup.jobstartup.qna.dto.QuestionDTO;
import com.pickmeup.jobstartup.qna.dto.QuestionFileDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface QnARepository {
    //게시글 입력
    public void insertQuestion(QuestionDTO questionDTO) throws DataAccessException;

    //파일 입력
    public void insertQuestionFile(QuestionFileDTO questionFileDTO) throws DataAccessException;

    //Qno 가져오기
    public long selectQno() throws DataAccessException;
}
