package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.dto.CertificateDTO;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CertificateRepositoryImpl implements CertificateRepository{

    @Autowired
    private SqlSession sqlSession;

    private static final Logger logger = LoggerFactory.getLogger(ResumeRepositoryImpl.class);

    @Override
    public int insertCertificate (List<CertificateDTO> certificateDTO) {
        return sqlSession.insert("certificate.insertCertificate", certificateDTO);
    }
}
