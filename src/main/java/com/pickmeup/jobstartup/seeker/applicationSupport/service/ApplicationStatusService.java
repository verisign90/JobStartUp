package com.pickmeup.jobstartup.seeker.applicationSupport.service;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.ResumeApplyDTO;

import java.util.Map;

public interface ApplicationStatusService {

    //지원하기
    public int insertResumeApply (Map<String, Integer> resumeApplyMap);
}
