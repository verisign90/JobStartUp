package com.pickmeup.jobstartup.main.controller;

import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.main.service.MainService;
import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {

    public final MainService mainService;

    @GetMapping("/main")
    public String mainPage(Model model){
        List<ApplyDTO> applyDTOList = mainService.getCompanyList();
        List<JobFairDTO> jobFairDTO = mainService.getJobFairList();
        System.out.println("MainController에서 applyDTO 내용"+applyDTOList);
        model.addAttribute("applyDTOList", applyDTOList);
        model.addAttribute("jobFairDTO",jobFairDTO);
        return "/main/main";
    }

    @GetMapping("/")
    public String mainPage02(Model model){
        List<ApplyDTO> applyDTOList = mainService.getCompanyList();
        List<JobFairDTO> jobFairDTO = mainService.getJobFairList();
        System.out.println("MainController에서 applyDTO 내용"+applyDTOList);
        model.addAttribute("applyDTOList", applyDTOList);
        model.addAttribute("jobFairDTO",jobFairDTO);
        return "/index";
    }

}
