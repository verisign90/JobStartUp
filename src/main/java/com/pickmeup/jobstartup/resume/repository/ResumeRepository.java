package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ResumeRepository {

    //이력서 목록 조회
    public List<ResumeDTO> selectResumeList ();

    //이력서 상세조회
    public ResumeDTO selectResumeDetail (int resume_no);

    //이력서 삭제
    public void deleteResume (int resume_no);

    //Career 삭제
    public void deleteCareer (int resume_no);

    //Certificate 삭제
    public void deleteCertificate (int resume_no);

    //LanguageCertificate 삭제
    public void deleteLanguageCertificate (int lang_no);

    //Language 삭제
    public void deleteLanguage (int resume_no);

    //ResumeLoc 삭제
    public void deleteResumeLoc (int resume_no);

    //이력서 작성
    public int insertResume (ResumeDTO resumeDTO);

    //등록된 이력서 시퀀스 받아오기
    public int getResumeSequence ();

    //Career
    public int insertCareer (@Param("careerDTOList") List<CareerDTO> careerDTOList);

    //Certificate
    public int insertCertificate (@Param("certificateDTOList") List<CertificateDTO> certificateDTOList);

    //LanguageCertificate
    public int insertLanguageCertificate (@Param("languageCertificateDTOList") List<LanguageCertificateDTO> languageCertificateDTOList);

    //Language
    public int insertLanguage (@Param("languageDTOList") List<LanguageDTO> languageDTOList);

    //Language 시퀀스 받아오기
    public int getLanguageSequence ();

    //ResumeLoc
    public int insertResumeLoc (@Param("resumeLocDTOList") List<ResumeLocDTO> resumeLocDTOList);
}
