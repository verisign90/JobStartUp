package com.pickmeup.jobstartup.seeker.resume.service;

import com.pickmeup.jobstartup.seeker.resume.dto.*;
import com.pickmeup.jobstartup.seeker.resume.repository.ResumeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
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

        List<Integer> langNoList = new ArrayList<>();

        int size = resumeDTO.getLanguageDTOList().size();
        logger.info("size:{}", size);





        for (LanguageDTO resumeDTOInLanguageDTO : resumeDTO.getLanguageDTOList()) {

                LanguageDTO languageDTO = LanguageDTO.builder()
                        .resume_no(getResumeSequence)
                        .lang_name(resumeDTOInLanguageDTO.getLang_name())
                        .lang_level(resumeDTOInLanguageDTO.getLang_level())
                        .build();

                resumeRepository.insertLanguage(Collections.singletonList(languageDTO));
                int langNo = resumeRepository.getLanguageSequence();
                logger.info("langNo: {}", langNo);
                langNoList.add(langNo);
                logger.info("langNoList: {}", langNoList);

        }

        /*for (LanguageCertificateDTO resumeDTOInLCDTO : resumeDTO.getLanguageCertificateDTOList()) {
            // langNoList의 크기를 사용하여 루프를 설정
            for (int i = 1; i < langNoList.size(); i++) {
                // 현재 i 인덱스에 해당하는 lang_no를 사용
                int langNoResult = langNoList.get(i);

                // languageCertificateDTO 생성
                LanguageCertificateDTO languageCertificateDTO = LanguageCertificateDTO.builder()
                        .lang_no(langNoResult)
                        .lang_cer_exam(resumeDTOInLCDTO.getLang_cer_exam())
                        .lang_cer_grade(resumeDTOInLCDTO.getLang_cer_grade())
                        .lang_cer_date(resumeDTOInLCDTO.getLang_cer_date())
                        .build();

                languageCertificateDTOList.add(languageCertificateDTO);
            }
        }*/
        int languageCertificateResult = 0;


        // langNoList와 resumeDTO.getLanguageCertificateDTOList()의 크기가 같다고 가정
        for (int i = 0; i < langNoList.size(); i++) {
            int langNoResult = langNoList.get(i);
            LanguageCertificateDTO resumeDTOInLCDTO = resumeDTO.getLanguageCertificateDTOList().get(i);

            LanguageCertificateDTO languageCertificateDTO = LanguageCertificateDTO.builder()
                    .lang_no(langNoResult)
                    .lang_cer_exam(resumeDTOInLCDTO.getLang_cer_exam())
                    .lang_cer_grade(resumeDTOInLCDTO.getLang_cer_grade())
                    .lang_cer_date(resumeDTOInLCDTO.getLang_cer_date())
                    .build();

            languageCertificateResult = resumeRepository.insertLanguageCertificate(Collections.singletonList(languageCertificateDTO));
        }


        /*for (LanguageCertificateDTO resumeDTOInLCDTO : resumeDTO.getLanguageCertificateDTOList()) {
            for (int langNoResult : langNoList) {
                LanguageCertificateDTO languageCertificateDTO = LanguageCertificateDTO.builder()
                        .lang_no(langNoResult)
                        .lang_cer_exam(resumeDTOInLCDTO.getLang_cer_exam())
                        .lang_cer_grade(resumeDTOInLCDTO.getLang_cer_grade())
                        .lang_cer_date(resumeDTOInLCDTO.getLang_cer_date())
                        .build();

                languageCertificateResult = resumeRepository.insertLanguageCertificate(Collections.singletonList(languageCertificateDTO));
            }
        }*/


        for (ResumeLocDTO resumeDTOInResumeLOCDTO : resumeDTO.getResumeLocDTOList()) {
            ResumeLocDTO resumeLocDTO = ResumeLocDTO.builder()
                    .resume_no(getResumeSequence)
                    .loc_detail_code_num(resumeDTOInResumeLOCDTO.getLoc_detail_code_num())
                    .build();

            resumeLocDTOList.add(resumeLocDTO);
        }


        int careerResult = resumeRepository.insertCareer(careerDTOList);
        int certificateResult = resumeRepository.insertCertificate(certificateDTOList);

        int resumeLocResult = resumeRepository.insertResumeLoc(resumeLocDTOList);

        if (careerResult >= 1 && certificateResult >= 1 &&
                languageCertificateResult >= 1 && resumeLocResult >= 1) {

        } else {
            throw new RuntimeException("트랜잭션 실패: 하나 이상의 작업이 실패했습니다.");
        }

    }

    // 이력서 부속테이블 작성
    /*@Override
    @Transactional
    public void insertResumeAttached(ResumeDTO resumeDTO, MultipartFile profileOrgNameFile, MultipartFile resumeOrgNameFile) throws IOException {
        logger.info("ResumeServiceImpl-insertResumeAttached() 진입");

        int getResumeSequence = this.insertResume(resumeDTO, profileOrgNameFile, resumeOrgNameFile);

        List<CareerDTO> careerDTOList = new ArrayList<>();
        List<CertificateDTO> certificateDTOList = new ArrayList<>();
        List<LanguageDTO> languageDTOList = new ArrayList<>();
        List<LanguageCertificateDTO> languageCertificateDTOList = new ArrayList<>();
        List<ResumeLocDTO> resumeLocDTOList = new ArrayList();

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

        // 언어 데이터 저장
        for (LanguageDTO resumeDTOInLanguageDTO : resumeDTO.getLanguageDTOList()) {
            LanguageDTO languageDTO = LanguageDTO.builder()
                    .resume_no(getResumeSequence)
                    .lang_name(resumeDTOInLanguageDTO.getLang_name())
                    .lang_level(resumeDTOInLanguageDTO.getLang_level())
                    .build();

            // 각 언어를 저장할 때마다 lang_no를 가져와 설정
            int langNo = resumeRepository.getLanguageSequence();
            languageDTO.setLang_no(langNo);
            languageDTOList.add(languageDTO);
        }

        for (int i = 0; i < resumeDTO.getLanguageCertificateDTOList().size(); i++) {
            LanguageCertificateDTO resumeDTOInLCDTO = resumeDTO.getLanguageCertificateDTOList().get(i);
            LanguageCertificateDTO languageCertificateDTO = LanguageCertificateDTO.builder()
                    .lang_no(languageDTOList.get(i).getLang_no()) // lang_no를 가져와 설정
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

        if (careerResult >= 1 && certificateResult >= 1 &&
                languageCertificateResult >= 1 && resumeLocResult >= 1) {
            // 트랜잭션 성공 처리
        } else {
            throw new RuntimeException("트랜잭션 실패: 하나 이상의 작업이 실패했습니다.");
        }
    }*/



    //이력서 수정
    @Override
    public void modifyResume (int resume_no, ResumeDTO modifyResumeDTO, MultipartFile profileOrgNameFile, MultipartFile resumeOrgNameFile) {

        List<CareerDTO> modifyCareerDTOList = new ArrayList<>();
        List<CertificateDTO> modifyCertificateDTOList = new ArrayList<>();
        List<LanguageDTO> modifyLanguageDTOList = new ArrayList<>();
        List<LanguageCertificateDTO> modifyLanguageCertificateDTOList = new ArrayList<>();
        List<ResumeLocDTO> modifyResumeLocDTOList = new ArrayList<>();

        ResumeDTO originalResumeDTO = resumeRepository.selectResumeDetail(resume_no);

        if (originalResumeDTO == null) {
            throw new NullPointerException();
        }

        originalResumeDTO.setMember_no(modifyResumeDTO.getMember_no());
        originalResumeDTO.setResume_title(modifyResumeDTO.getResume_title());

        /*if (!originalResumeDTO.getProfile_savname().equals(modifyResumeDTO.getProfile_savname())) {

        }*/
        //프로필 사진 수정
        //originalResumeDTO.setProfile_savname(modifyResumeDTO.getProfile_savname());
        originalResumeDTO.setResume_money(modifyResumeDTO.getResume_money());
        originalResumeDTO.setResume_skill(modifyResumeDTO.getResume_skill());
        //첨부파일 수정
        //originalResumeDTO.set(modifyResumeDTO.get);
        originalResumeDTO.setResume_url(modifyResumeDTO.getResume_url());

        //Career 수정
        for (CareerDTO originalCareerDTO : originalResumeDTO.getCareerDTOList()) {
            for (CareerDTO modifyCareerDTO : modifyResumeDTO.getCareerDTOList()) {
                originalCareerDTO.setCareer_date(modifyCareerDTO.getCareer_date());
                originalCareerDTO.setCareer_company(modifyCareerDTO.getCareer_company());
                originalCareerDTO.setBusiness_type(modifyCareerDTO.getBusiness_type());
                originalCareerDTO.setCareer_work(modifyCareerDTO.getCareer_work());
            }

            modifyCareerDTOList.add(originalCareerDTO);
        }

        //Certificate 수정
        for (CertificateDTO originalCertificateDTO : originalResumeDTO.getCertificateDTOList()) {
            for (CertificateDTO modifyCertificateDTO : modifyResumeDTO.getCertificateDTOList()) {
                originalCertificateDTO.setCer_name(modifyCertificateDTO.getCer_name());
                originalCertificateDTO.setCer_issuer(modifyCertificateDTO.getCer_issuer());
                originalCertificateDTO.setCer_date(modifyCertificateDTO.getCer_date());
            }

            modifyCertificateDTOList.add(originalCertificateDTO);
        }

        //Language 수정
        for (LanguageDTO originalLanguageDTO : originalResumeDTO.getLanguageDTOList()) {
            for (LanguageDTO modifyLanguageDTO : modifyResumeDTO.getLanguageDTOList()) {
                originalLanguageDTO.setLang_name(modifyLanguageDTO.getLang_name());
                originalLanguageDTO.setLang_level(modifyLanguageDTO.getLang_level());
            }

            modifyLanguageDTOList.add(originalLanguageDTO);
        }

        //LanguageCertificate 수정
        for (LanguageCertificateDTO originalLanguageCertificateDTO : originalResumeDTO.getLanguageCertificateDTOList()) {
            for (LanguageCertificateDTO modifyLanguageCertificateDTO : modifyResumeDTO.getLanguageCertificateDTOList()) {
                originalLanguageCertificateDTO.setLang_cer_exam(modifyLanguageCertificateDTO.getLang_cer_exam());
                originalLanguageCertificateDTO.setLang_cer_grade(modifyLanguageCertificateDTO.getLang_cer_grade());
                originalLanguageCertificateDTO.setLang_cer_date(modifyLanguageCertificateDTO.getLang_cer_date());
            }

            modifyLanguageCertificateDTOList.add(originalLanguageCertificateDTO);
        }

        //ResumeLoc 수정
        for (ResumeLocDTO originalResumeLocDTO : originalResumeDTO.getResumeLocDTOList()) {
            for (ResumeLocDTO modifyResumeLocDTO : modifyResumeDTO.getResumeLocDTOList()) {
                originalResumeLocDTO.setLoc_detail_code_num(modifyResumeLocDTO.getLoc_detail_code_num());
            }

            modifyResumeLocDTOList.add(originalResumeLocDTO);
        }

        resumeRepository.modifyResume(originalResumeDTO);
        resumeRepository.modifyResumeLoc(modifyResumeLocDTOList);
        resumeRepository.modifyCareer(modifyCareerDTOList);
        resumeRepository.modifyCertificate(modifyCertificateDTOList);
        resumeRepository.modifyLanguageCertificate(modifyLanguageCertificateDTOList);
        resumeRepository.modifyLanguage(modifyLanguageDTOList);
    }
}

