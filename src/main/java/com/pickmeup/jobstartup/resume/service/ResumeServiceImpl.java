package com.pickmeup.jobstartup.resume.service;

import com.pickmeup.jobstartup.resume.controller.ResumeController;
import com.pickmeup.jobstartup.resume.dto.*;
import com.pickmeup.jobstartup.resume.repository.ResumeRepository;
import com.pickmeup.jobstartup.resume.repository.ResumeRepositoryImpl;
import org.apache.ibatis.annotations.Lang;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.xml.crypto.dsig.XMLSignature;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Service
public class ResumeServiceImpl implements ResumeService{

    @Autowired
    private ResumeRepositoryImpl resumeRepository;

    private static final Logger logger = LoggerFactory.getLogger(ResumeServiceImpl.class);

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
    public int insertResume (ResumeParameter resumeParameter) {
        logger.info("ResumeServiceImpl-insertResume() 진입");

        if (!resumeParameter.getResumeDTO().getProfile_orgname().isEmpty()) {

            String profileDirectory = "C:/jobStartUp_fileUpload/profile_img/";
            File directory = new File(profileDirectory);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            UUID uuid = UUID.randomUUID();

            String profileOrgName = resumeParameter.getResumeDTO().getProfile_orgname();
            String profileSavName = resumeParameter.getResumeDTO().getProfile_orgname() + uuid;

            resumeParameter.getResumeDTO().setProfile_orgname(profileOrgName);
            resumeParameter.getResumeDTO().setProfile_savname(profileSavName);
        }

        if (!resumeParameter.getResumeDTO().getResume_orgname().isEmpty()) {

            String fileDirectory = "C:/jobStartUp_fileUpload/resumeFile/";
            File directory = new File(fileDirectory);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            UUID uuid = UUID.randomUUID();

            String resumeOrgName = resumeParameter.getResumeDTO().getResume_orgname();
            String resumeSavName = resumeParameter.getResumeDTO().getResume_orgname() + uuid;

            resumeParameter.getResumeDTO().setResume_orgname(resumeOrgName);
            resumeParameter.getResumeDTO().setResume_savname(resumeSavName);
        }

        if (resumeParameter.getResumeDTO().getResume_url() == null && resumeParameter.getResumeDTO().getResume_url().equals("")){
            resumeParameter.getResumeDTO().setResume_url("");
        }

        return resumeRepository.insertResume(resumeParameter);
    }
}

