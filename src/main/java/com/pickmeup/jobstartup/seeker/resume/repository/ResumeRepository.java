package com.pickmeup.jobstartup.seeker.resume.repository;

import com.pickmeup.jobstartup.seeker.resume.dto.*;
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

    /*Resume*/
    //이력서 삭제
    public void deleteResume (int resume_no);
    //이력서 작성
    public int insertResume (ResumeDTO resumeDTO);
    //등록된 이력서 시퀀스 받아오기
    public int getResumeSequence ();
    //수정
    public  int modifyResume (ResumeDTO resumeDTO);


    /*Career*/
    //입력
    public int insertCareer (@Param("careerDTOList") List<CareerDTO> careerDTOList);
    //삭제
    public void deleteCareer (int resume_no);
    //수정
    public void modifyCareer (@Param("careerDTOList") List<CareerDTO> careerDTOList);


    /*Certificate*/
    //입력
    public int insertCertificate (@Param("certificateDTOList") List<CertificateDTO> certificateDTOList);
    //삭제
    public void deleteCertificate (int resume_no);
    //수정
    public void modifyCertificate (@Param("certificateDTOList") List<CertificateDTO> certificateDTOList);


    /*LanguageCertificate*/
    //입력
    public int insertLanguageCertificate (@Param("languageCertificateDTOList") List<LanguageCertificateDTO> languageCertificateDTOList);
    //삭제
    public void deleteLanguageCertificate (int lang_no);
    //수정
    public void modifyLanguageCertificate (@Param("languageCertificateDTOList") List<LanguageCertificateDTO> languageCertificateDTOList);


    /*Language*/
    //입력
    public int insertLanguage (@Param("languageDTOList") List<LanguageDTO> languageDTOList);
    //삭제
    public void deleteLanguage (int resume_no);
    //수정
    public void modifyLanguage (@Param("languageDTOList") List<LanguageDTO> languageDTOList);

    //Language 시퀀스 받아오기
    public int getLanguageSequence ();


    /*ResumeLoc*/
    //입력
    public int insertResumeLoc (@Param("resumeLocDTOList") List<ResumeLocDTO> resumeLocDTOList);
    //삭제
    public void deleteResumeLoc (int resume_no);
    //수정
    public void modifyResumeLoc (@Param("resumeLocDTOList") List<ResumeLocDTO> resumeLocDTOList);

}
