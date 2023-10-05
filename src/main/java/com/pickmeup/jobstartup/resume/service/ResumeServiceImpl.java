package com.pickmeup.jobstartup.resume.service;

import com.pickmeup.jobstartup.resume.dto.*;
import com.pickmeup.jobstartup.resume.repository.*;
import org.apache.ibatis.transaction.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class ResumeServiceImpl implements ResumeService{
    private static final Logger logger = LoggerFactory.getLogger(ResumeServiceImpl.class);

    @Autowired
    private ResumeRepositoryImpl resumeRepository;

    @Autowired
    private CareerRepositoryImpl careerRepository;

    @Autowired
    private CertificateRepositoryImpl certificateRepository;

    @Autowired
    private LanguageRepositoryImpl languageRepository;

    @Autowired
    private LanguageCertificateRepositoryImpl languageCertificateRepository;

    @Autowired
    private ResumeLocRepositoryImpl resumeLocRepository;


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

    //이력서 작성
    @Override
    @Transactional
    public int insertResume (ResumeDTO resumeDTO) {
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
        }

        if (resumeDTO.getResume_url() == null && resumeDTO.getResume_url().equals("")){
            resumeDTO.setResume_url("");
        }

        int resumeResult = resumeRepository.insertResume(resumeDTO);


        List<CareerDTO> careerDTOList = new ArrayList<>();
        List<CertificateDTO> certificateDTOList = new ArrayList<>();
        List<LanguageDTO> languageDTOList = new ArrayList<>();
        List<LanguageCertificateDTO> languageCertificateDTOList = new ArrayList<>();
        List<ResumeLocDTO> resumeLocDTOList = new ArrayList<>();

        for (CareerDTO resumeDTOInCareerDTO : resumeDTO.getCareerDTOList()) {
            CareerDTO careerDTO = new CareerDTO();
            /*careerDTO.setResume_no(resumeDTOInCareerDTO.getResume_no());
            careerDTO.setCareer_company(resumeDTOInCareerDTO.getCareer_company());
            careerDTO.setBusiness_type(resumeDTOInCareerDTO.getBusiness_type());
            careerDTO.setCareer_work(resumeDTOInCareerDTO.getCareer_work());
            careerDTO.setCareer_date(resumeDTOInCareerDTO.getCareer_date());

            careerDTOList.add(careerDTO);*/
            CareerDTO careerDTO1 = CareerDTO.builder()
                    .resume_no(resumeDTOInCareerDTO.getResume_no())
                    .career_company(resumeDTOInCareerDTO.getCareer_company())
                    .business_type(resumeDTOInCareerDTO.getBusiness_type())
                    .career_work(resumeDTOInCareerDTO.getCareer_work())
                    .career_date(resumeDTOInCareerDTO.getCareer_date())
                    .build();

            careerDTOList.add(careerDTO1);
        }

        int careerResult = careerRepository.insertCareer(careerDTOList);

        for (CertificateDTO resumeDTOInCertificateDTO : resumeDTO.getCertificateDTOList()) {
            CertificateDTO certificateDTO = CertificateDTO.builder()
                    .resume_no(resumeDTOInCertificateDTO.getResume_no())
                    .cer_name(resumeDTOInCertificateDTO.getCer_name())
                    .cer_issuer(resumeDTOInCertificateDTO.getCer_issuer())
                    .cer_date(resumeDTOInCertificateDTO.getCer_date())
                    .build();

            certificateDTOList.add(certificateDTO);
        }

        int certificateResult = certificateRepository.insertCertificate(certificateDTOList);

        for (LanguageDTO resumeDTOInLanguageDTO : resumeDTO.getLanguageDTOList()) {
            LanguageDTO languageDTO = LanguageDTO.builder()
                    .resume_no(resumeDTOInLanguageDTO.getResume_no())
                    .lang_name(resumeDTOInLanguageDTO.getLang_name())
                    .lang_level(resumeDTOInLanguageDTO.getLang_level())
                    .build();

            languageDTOList.add(languageDTO);
        }

        int languageResult = languageRepository.insertLanguage(languageDTOList);

        for (LanguageCertificateDTO resumeDTOInLCDTO : resumeDTO.getLanguageCertificateDTOList()) {
            for (LanguageDTO language : resumeDTO.getLanguageDTOList()) {
                LanguageCertificateDTO languageCertificateDTO = LanguageCertificateDTO.builder()
                        .lang_no(language.getLang_no())
                        .lang_cer_exam(resumeDTOInLCDTO.getLang_cer_exam())
                        .lang_cer_grade(resumeDTOInLCDTO.getLang_cer_grade())
                        .lang_cer_date(resumeDTOInLCDTO.getLang_cer_date())
                        .build();

                languageCertificateDTOList.add(languageCertificateDTO);
            }
        }

        int languageCertificateResult = languageCertificateRepository.insertLanguageCertificate(languageCertificateDTOList);

        for (ResumeLocDTO resumeDTOInResumeLOCDTO : resumeDTO.getResumeLocDTOList()) {
            ResumeLocDTO resumeLocDTO = ResumeLocDTO.builder()
                    .resume_no(resumeDTO.getResume_no())
                    .loc_detail_code_num(resumeDTOInResumeLOCDTO.getLoc_detail_code_num())
                    .build();

            resumeLocDTOList.add(resumeLocDTO);
        }

        int resumeLocResult = resumeLocRepository.insertResumeLoc(resumeLocDTOList);

        if (resumeResult == 1 && careerResult == 1 && certificateResult == 1 && languageResult == 1 &&
                languageCertificateResult == 1 && resumeLocResult == 1) {

        } else {
            throw new RuntimeException("트랜잭션 실패: 하나 이상의 작업이 실패했습니다.");
        }

        return 1;
    }
}

