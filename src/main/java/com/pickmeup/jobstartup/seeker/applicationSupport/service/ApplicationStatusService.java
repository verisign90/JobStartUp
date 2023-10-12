package com.pickmeup.jobstartup.seeker.applicationSupport.service;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.ResumeApplyDTO;

public interface ApplicationStatusService {

    //지원하기
    public int insertResumeApply (ResumeApplyDTO resumeApplyDTO);
}
