package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.dto.LanguageCertificateDTO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LanguageCertificateRepositoryImpl implements LanguageCertificateRepository{

    @Autowired
    private SqlSession sqlSession;

    private static final Logger logger = LoggerFactory.getLogger(ResumeRepositoryImpl.class);

    @Override
    public int insertLanguageCertificate (List<LanguageCertificateDTO> languageCertificateDTO) {
        return sqlSession.insert("languageCertificate.insertLanguageCertificate", languageCertificateDTO);
    }
}
