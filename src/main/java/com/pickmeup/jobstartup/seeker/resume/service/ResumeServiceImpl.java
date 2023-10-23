package com.pickmeup.jobstartup.seeker.resume.service;

import com.pickmeup.jobstartup.recruiter.apply.dto.JobDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.repository.ApplicationStatusRepository;
import com.pickmeup.jobstartup.seeker.resume.dto.*;
import com.pickmeup.jobstartup.seeker.resume.repository.ResumeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.ReturnedType;
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

    @Autowired
    private ApplicationStatusRepository applicationStatusRepository;

    //이력서 목록조회
    @Override
    public List<ResumeDTO> selectResumeList (int member_no) {
        logger.info("ResumeServiceImpl-selectResumeList() 진입");
        return resumeRepository.selectResumeList(member_no);
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
        applicationStatusRepository.deleteApply(resume_no);
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

        int languageCertificateResult = 0;


        // langNoList와 resumeDTO.getLanguageCertificateDTOList()의 크기가 같다고 가정
        for (int i = 0; i < langNoList.size(); i++) {
            int langNoResult = langNoList.get(i);
            logger.info("langNoList.size(): {}", langNoList.size());
            logger.info("resumeDTO.getLanguageCertificateDTOList(): {}", resumeDTO.getLanguageCertificateDTOList());
            logger.info("resumeDTO.getLanguageCertificateDTOList().get(i):{}", resumeDTO.getLanguageCertificateDTOList().get(i));
            logger.info("resumeDTO.getLanguageCertificateDTOList().size(): {}", resumeDTO.getLanguageCertificateDTOList().size());

            LanguageCertificateDTO resumeDTOInLCDTO = resumeDTO.getLanguageCertificateDTOList().get(i);

            LanguageCertificateDTO languageCertificateDTO = LanguageCertificateDTO.builder()
                    .lang_no(langNoResult)
                    .lang_cer_exam(resumeDTOInLCDTO.getLang_cer_exam())
                    .lang_cer_grade(resumeDTOInLCDTO.getLang_cer_grade())
                    .lang_cer_date(resumeDTOInLCDTO.getLang_cer_date())
                    .build();

            languageCertificateResult = resumeRepository.insertLanguageCertificate(Collections.singletonList(languageCertificateDTO));
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

        int resumeLocResult = resumeRepository.insertResumeLoc(resumeLocDTOList);

        if (careerResult >= 1 && certificateResult >= 1 &&
                languageCertificateResult >= 1 && resumeLocResult >= 1) {

        } else {
            throw new RuntimeException("트랜잭션 실패: 하나 이상의 작업이 실패했습니다.");
        }

    }

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

    //상위 지역 리스트 가져오기
    @Override
    public List<LocDTO> getUpperLoc() {
        List<LocDTO> upperLoc = resumeRepository.getUpperLoc();
        System.out.println("서비스 upperLoc = " + upperLoc);
        return upperLoc;
    }

    //상위 지역에 따른 하위 지역 리스트 가져오기
    @Override
    public List<LocDTO> getLowerLoc(String upperLoc) {
        List<LocDTO> lowerLoc = resumeRepository.getLowerLoc(upperLoc);
        return lowerLoc;
    }

    @Override
    public List<JobDTO> getBusiness_type_code_up(){
        return resumeRepository.getBusiness_type_code_up();
    }

    @Override
    public List<JobDTO> getBusiness_type_code(String business_type_code_up){
        return resumeRepository.getBusiness_type_code(business_type_code_up);
    }

    @Override
    public List<LocDTO> selectDetailName (String detail_code_num) {
        List<LocDTO> result = resumeRepository.selectDetailName(detail_code_num);
        logger.info("result : {}", result);
        return result;
    }

}

