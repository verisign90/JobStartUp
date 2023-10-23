package com.pickmeup.jobstartup.seeker.applicationSupport.service;

import com.pickmeup.jobstartup.recruiter.apply.dto.JobDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.controller.ApplicationStatusController;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.ResumeApplyDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.repository.ApplicationStatusRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ApplicationStatusServiceImpl implements ApplicationStatusService {

    private static final Logger logger = LoggerFactory.getLogger(ApplicationStatusServiceImpl.class);

    @Autowired
    private ApplicationStatusRepository applicationStatusRepository;

    //지원하기
    @Override
    public int insertResumeApply (Map<String, Integer> resumeApplyMap) {
        System.out.println("ApplicationStatusServiceImpl-resumeApply()진입");
        return applicationStatusRepository.insertResumeApply(resumeApplyMap);
    }

    //이력서 지원현황
    @Override
    public List<ResumeApplyDTO> selectApplyStatus (int member_no) {
        logger.info("ApplicationStatusServiceImpl-selectApplyStatus() 진입");
        logger.info("member_no: {}", member_no);
        return applicationStatusRepository.selectApplyStatus(member_no);
    }

    //오늘 면접 조회
    @Override
    public List<ResumeApplyDTO> selectToday (int member_no) {
        return applicationStatusRepository.selectToday(member_no);
    }

    //예정 면접 조회
    @Override
    public List<ResumeApplyDTO> selectPlan (int member_no) {
        return applicationStatusRepository.selectPlan(member_no);
    }

}
