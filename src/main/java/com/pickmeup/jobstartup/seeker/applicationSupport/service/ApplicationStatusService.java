package com.pickmeup.jobstartup.seeker.applicationSupport.service;

import com.pickmeup.jobstartup.recruiter.apply.dto.JobDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.ResumeApplyDTO;

import java.util.List;
import java.util.Map;

public interface ApplicationStatusService {

    //지원하기
    public int insertResumeApply (Map<String, Integer> resumeApplyMap);

    //이력서 지원현황
    List<ResumeApplyDTO> selectApplyStatus (int member_no);

}
