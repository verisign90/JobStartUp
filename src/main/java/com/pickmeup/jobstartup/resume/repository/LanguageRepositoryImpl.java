package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.dto.LanguageDTO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LanguageRepositoryImpl implements LanguageRepository{

    @Autowired
    private SqlSession sqlSession;

    private static final Logger logger = LoggerFactory.getLogger(ResumeRepositoryImpl.class);

    @Override
    public int insertLanguage (List<LanguageDTO> languageDTO) {
        return sqlSession.insert("language.insertLanguage", languageDTO);
    }
}
