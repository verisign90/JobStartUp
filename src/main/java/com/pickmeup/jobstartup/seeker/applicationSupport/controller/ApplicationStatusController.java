package com.pickmeup.jobstartup.seeker.applicationSupport.controller;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.ResumeApplyDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.ApplicationStatusServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping ("/seeker")
public class ApplicationStatusController {

    @Autowired
    private ApplicationStatusServiceImpl applicationStatusService;

    //지원하기 버튼 클릭시
    @RequestMapping ("/resumeApply")
    public String resumeApply (@ModelAttribute ResumeApplyDTO resumeApplyDTO) {
        applicationStatusService.insertResumeApply(resumeApplyDTO);
        return "seeker/applicationSupport/resumeApplyResult";
    }
}
