package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.controller.ResumeController;
import com.pickmeup.jobstartup.resume.dto.*;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ResumeRepositoryImpl implements ResumeRepository {

    //Sqlsession 사용해서 sql문 실행
    @Autowired
    private SqlSession sqlSession;

    private static final Logger logger = LoggerFactory.getLogger(ResumeRepositoryImpl.class);

    //이력서 목록 조회
    @Override
    public List<ResumeDTO> selectResumeList () {
        logger.info("ResumeRepositoryImpl-selectResumeList()진입");
        logger.info("resumeList: {}", sqlSession.selectList("resume.selectResumeList"));
        return sqlSession.selectList("resume.selectResumeList"); //sqlSession이 실행할 namespace
    }

    //이력서 상세조회
    @Override
    public ResumeDTO selectResumeDetail (int resume_no) {
        logger.info("ResumeRepositoryImpl-selectResumeDetail() 진입");
        return sqlSession.selectOne("resume.selectResumeDetail", resume_no);
    }

    //이력서 삭제
    @Override
    public void deleteResume (int resume_no) {
        logger.info("ResumeRepositoryImpl-deleteResume() 진입");
        sqlSession.delete("resume.deleteResume", resume_no);
    }

    //이력서 작성
    @Override
    public int insertResume (ResumeParameter resumeParameter) {
        logger.info("ResumeRepositoryImpl-insertResume() 진입");
        return sqlSession.insert("resume.insertResume", resumeParameter);
    }
}
