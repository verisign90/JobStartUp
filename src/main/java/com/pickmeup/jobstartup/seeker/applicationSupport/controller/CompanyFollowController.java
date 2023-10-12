package com.pickmeup.jobstartup.seeker.applicationSupport.controller;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.CompanyFollowDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.CompanyFollowServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping ("/seeker")
public class CompanyFollowController {

    @Autowired
    private CompanyFollowServiceImpl companyFollowService;

    @RequestMapping ("/companyFollowList/{member_no}")
    public String selectCompanyFollowList (@PathVariable int member_no, Model model) {
        List<CompanyFollowDTO> companyFollowResult = companyFollowService.selectCompanyFollowList(member_no);
        model.addAttribute("companyFollowResult", companyFollowResult);
        return "seeker/applicationSupport/companyFollowList";
    }
}
