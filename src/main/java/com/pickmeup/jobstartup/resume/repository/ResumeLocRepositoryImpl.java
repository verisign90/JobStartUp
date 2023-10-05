package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.dto.ResumeLocDTO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ResumeLocRepositoryImpl implements ResumeLocRepository{

    @Autowired
    private SqlSession sqlSession;

    private static final Logger logger = LoggerFactory.getLogger(ResumeRepositoryImpl.class);

    @Override
    public int insertResumeLoc (List<ResumeLocDTO> resumeLocDTO) {
        return sqlSession.insert("resumeLoc.insertResumeLoc", resumeLocDTO);
    }
}
