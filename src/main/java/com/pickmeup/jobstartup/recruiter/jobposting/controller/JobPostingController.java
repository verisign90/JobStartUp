package com.pickmeup.jobstartup.recruiter.jobposting.controller;

import com.pickmeup.jobstartup.recruiter.jobposting.service.JobPostingService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/recruiter")
@RequiredArgsConstructor
@Controller
public class JobPostingController {

//    private final JobPostingService jobPostingService;

    @GetMapping("/write")
    public String write(){
        return "/recruiter/jobPosting/JPwriteForm";
    }
}
