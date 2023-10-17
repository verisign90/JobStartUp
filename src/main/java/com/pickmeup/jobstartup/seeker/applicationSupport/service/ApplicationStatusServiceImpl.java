package com.pickmeup.jobstartup.seeker.applicationSupport.service;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.ResumeApplyDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.repository.ApplicationStatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class ApplicationStatusServiceImpl implements ApplicationStatusService {

    @Autowired
    private ApplicationStatusRepository applicationStatusRepository;

    //지원하기
    @Override
    public int insertResumeApply (Map<String, Integer> resumeApplyMap) {
        System.out.println("ApplicationStatusServiceImpl-resumeApply()진입");
        return applicationStatusRepository.insertResumeApply(resumeApplyMap);
    }
}
