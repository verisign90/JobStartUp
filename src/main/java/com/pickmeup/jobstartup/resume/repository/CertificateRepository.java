package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.dto.CertificateDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CertificateRepository {

    public int insertCertificate (List<CertificateDTO> certificateDTO);
}
