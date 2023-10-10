package com.pickmeup.jobstartup.resume.service;

import com.pickmeup.jobstartup.resume.dto.*;
import com.pickmeup.jobstartup.resume.repository.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class ResumeServiceImpl implements ResumeService{
    private static final Logger logger = LoggerFactory.getLogger(ResumeServiceImpl.class);

    @Autowired
    private ResumeRepository resumeRepository;

    //이력서 목록조회
    @Override
    public List<ResumeDTO> selectResumeList () {
        logger.info("ResumeServiceImpl-selectResumeList() 진입");
        return resumeRepository.selectResumeList();
    }

    //이력서 상세 조회
    @Override
    public ResumeDTO selectResumeDetail (int resume_no) {
        logger.info("ResumeServiceImpl-selectResumeDetail() 진입");
        return resumeRepository.selectResumeDetail(resume_no);
    }

    //이력서 삭제
    @Override
    public void deleteResume (int resume_no) {
        logger.info("ResumeServiceImpl-deleteResume() 진입");
        resumeRepository.deleteResume(resume_no);
    }

    //부속테이블 삭제
    @Override
    public void deleteResumeAttached (int resume_no, int lang_no) {
        logger.info("ResumeServiceImpl-deleteResumeAttached() 진입");
        resumeRepository.deleteCareer(resume_no);
        resumeRepository.deleteLanguageCertificate(lang_no);
        resumeRepository.deleteLanguage(resume_no);
        resumeRepository.deleteResumeLoc(resume_no);
        resumeRepository.deleteCertificate(resume_no);
        deleteResume(resume_no);
    }

    //이력서 작성
    @Override
    public int insertResume(ResumeDTO resumeDTO, MultipartFile profileOrgNameFile, MultipartFile resumeOrgNameFile) throws IOException {
        logger.info("ResumeServiceImpl-insertResume() 진입");

        if (!resumeDTO.getProfile_orgname().isEmpty()) {

            String profileDirectory = "C:/jobStartUp_fileUpload/profile_img/";
            File directory = new File(profileDirectory);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            UUID uuid = UUID.randomUUID();

            String profileOrgName = resumeDTO.getProfile_orgname();
            String profileSavName = resumeDTO.getProfile_orgname() + uuid;

            resumeDTO.setProfile_orgname(profileOrgName);
            resumeDTO.setProfile_savname(profileSavName);

            File dest = new File (profileDirectory + profileSavName);
            profileOrgNameFile.transferTo(dest);

        }

        if (resumeDTO.getResume_orgname() == null || resumeDTO.getResume_orgname().equals("")) {
            resumeDTO.setResume_orgname("");
            resumeDTO.setResume_savname("");
        }

        if (!resumeDTO.getResume_orgname().isEmpty()) {

            String fileDirectory = "C:/jobStartUp_fileUpload/resumeFile/";
            File directory = new File(fileDirectory);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            UUID uuid = UUID.randomUUID();

            String resumeOrgName = resumeDTO.getResume_orgname();
            String resumeSavName = resumeDTO.getResume_orgname() + uuid;

            resumeDTO.setResume_orgname(resumeOrgName);
            resumeDTO.setResume_savname(resumeSavName);

            File dest = new File (fileDirectory + resumeSavName);
            resumeOrgNameFile.transferTo(dest);
        }

        if (resumeDTO.getResume_url() == null || resumeDTO.getResume_url().equals("")){
            resumeDTO.setResume_url("");
        }

        resumeRepository.insertResume(resumeDTO);

        int resumeNo = resumeRepository.getResumeSequence();

        logger.info("ResumeServiceImpl-insertResume() resumeNo: {}", resumeNo);

        return resumeNo;
    }


    //이력서 부속테이블 작성
    @Override
    @Transactional
    public void insertResumeAttached (ResumeDTO resumeDTO, MultipartFile profileOrgNameFile, MultipartFile resumeOrgNameFile) throws IOException {
        logger.info("ResumeServiceImpl-insertResumeAttached() 진입");

        int getResumeSequence = this.insertResume(resumeDTO, profileOrgNameFile, resumeOrgNameFile);


        List<CareerDTO> careerDTOList = new ArrayList<>();
        List<CertificateDTO> certificateDTOList = new ArrayList<>();
        List<LanguageDTO> languageDTOList = new ArrayList<>();
        List<LanguageCertificateDTO> languageCertificateDTOList = new ArrayList<>();
        List<ResumeLocDTO> resumeLocDTOList = new ArrayList<>();

        for (CareerDTO resumeDTOInCareerDTO : resumeDTO.getCareerDTOList()) {
            CareerDTO careerDTO = CareerDTO.builder()
                    .resume_no(getResumeSequence)
                    .career_company(resumeDTOInCareerDTO.getCareer_company())
                    .business_type(resumeDTOInCareerDTO.getBusiness_type())
                    .career_work(resumeDTOInCareerDTO.getCareer_work())
                    .career_date(resumeDTOInCareerDTO.getCareer_date())
                    .build();

            careerDTOList.add(careerDTO);
        }


        for (CertificateDTO resumeDTOInCertificateDTO : resumeDTO.getCertificateDTOList()) {
            CertificateDTO certificateDTO = CertificateDTO.builder()
                    .resume_no(getResumeSequence)
                    .cer_name(resumeDTOInCertificateDTO.getCer_name())
                    .cer_issuer(resumeDTOInCertificateDTO.getCer_issuer())
                    .cer_date(resumeDTOInCertificateDTO.getCer_date())
                    .build();

            certificateDTOList.add(certificateDTO);
        }


        for (LanguageDTO resumeDTOInLanguageDTO : resumeDTO.getLanguageDTOList()) {
            LanguageDTO languageDTO = LanguageDTO.builder()
                    .resume_no(getResumeSequence)
                    .lang_name(resumeDTOInLanguageDTO.getLang_name())
                    .lang_level(resumeDTOInLanguageDTO.getLang_level())
                    .build();

            languageDTOList.add(languageDTO);
        }

        resumeRepository.insertLanguage(languageDTOList);
        int langNo = resumeRepository.getLanguageSequence();


        for (LanguageCertificateDTO resumeDTOInLCDTO : resumeDTO.getLanguageCertificateDTOList()) {
                LanguageCertificateDTO languageCertificateDTO = LanguageCertificateDTO.builder()
                        .lang_no(langNo)
                        .lang_cer_exam(resumeDTOInLCDTO.getLang_cer_exam())
                        .lang_cer_grade(resumeDTOInLCDTO.getLang_cer_grade())
                        .lang_cer_date(resumeDTOInLCDTO.getLang_cer_date())
                        .build();

                languageCertificateDTOList.add(languageCertificateDTO);
        }


        for (ResumeLocDTO resumeDTOInResumeLOCDTO : resumeDTO.getResumeLocDTOList()) {
            ResumeLocDTO resumeLocDTO = ResumeLocDTO.builder()
                    .resume_no(getResumeSequence)
                    .loc_detail_code_num(resumeDTOInResumeLOCDTO.getLoc_detail_code_num())
                    .build();

            resumeLocDTOList.add(resumeLocDTO);
        }


        int careerResult = resumeRepository.insertCareer(careerDTOList);
        int certificateResult = resumeRepository.insertCertificate(certificateDTOList);
        int languageCertificateResult = resumeRepository.insertLanguageCertificate(languageCertificateDTOList);
        int resumeLocResult = resumeRepository.insertResumeLoc(resumeLocDTOList);

        if (careerResult == 1 && certificateResult == 1 &&
                languageCertificateResult == 1 && resumeLocResult == 1) {

        } else {
            throw new RuntimeException("트랜잭션 실패: 하나 이상의 작업이 실패했습니다.");
        }

    }
}

