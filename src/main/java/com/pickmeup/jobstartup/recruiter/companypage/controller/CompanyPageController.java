package com.pickmeup.jobstartup.recruiter.companypage.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/recruiter")
@RequiredArgsConstructor
@Controller
public class CompanyPageController {


    @RequestMapping("/companyPage")
    public String companyPageTest(){




        return "/recruiter/companypage/companyPage";
    }



}
