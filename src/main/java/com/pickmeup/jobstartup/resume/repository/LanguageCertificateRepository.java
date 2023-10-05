package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.dto.LanguageCertificateDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface LanguageCertificateRepository {

    public int insertLanguageCertificate (List<LanguageCertificateDTO> languageCertificateDTO);
}
