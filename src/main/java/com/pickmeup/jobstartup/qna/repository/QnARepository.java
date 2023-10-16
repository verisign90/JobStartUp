package com.pickmeup.jobstartup.qna.repository;

import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.qna.dto.AnswerDTO;
import com.pickmeup.jobstartup.qna.dto.AnswerFileDTO;
import com.pickmeup.jobstartup.qna.dto.QuestionDTO;
import com.pickmeup.jobstartup.qna.dto.QuestionFileDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface QnARepository {
    //게시글 입력
    public void insertQuestion(QuestionDTO questionDTO) throws DataAccessException;

    //파일 입력
    public void insertQuestionFile(QuestionFileDTO questionFileDTO) throws DataAccessException;

    //Qno 가져오기
    public long selectQno() throws DataAccessException;

    public List<QuestionDTO> selectQuestionList(Criteria criteria) throws DataAccessException;

    public int selectQuestionCnt() throws DataAccessException;

    public List<QuestionFileDTO> selectQFileList(long qNo) throws DataAccessException;

    public void insertAnswer(AnswerDTO answerDTO) throws DataAccessException;

    public long selectAno() throws DataAccessException;

    public void insertAnswerFile(AnswerFileDTO answerFileDTO) throws DataAccessException;

    public AnswerDTO selectAnswerByQno(long qNo) throws DataAccessException;

    public List<AnswerFileDTO> selectAnswerFileByAno(long aNo) throws DataAccessException;

    public QuestionDTO selectQuestionByQno(long qNo) throws DataAccessException;

    public void deleteFileAll(long qNo) throws DataAccessException;

    public void updateQuestion(QuestionDTO questionDTO) throws DataAccessException;

    public QuestionFileDTO selectQuestionFileByFileNo(Long qFileNo) throws DataAccessException;

    public void deleteFileByFileNo(Long qFileNo) throws DataAccessException;

    public void deleteAnswerFileAll(long aNo) throws DataAccessException;

    public void deleteAnswerByNo(long aNo) throws DataAccessException;

    public void deleteQuestionByNo(long qNo) throws DataAccessException;

    public void updateAnswer(AnswerDTO answerDTO) throws DataAccessException;

    public AnswerFileDTO selectAnswerFileMyFileNo(Long aFileNo);
}
