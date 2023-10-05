package com.pickmeup.jobstartup.jobfair.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.jobfair.service.JobFairService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class JobFairController {

    private final JobFairService jobFairService;

    @GetMapping("/admin/jobfairlist")
    public String jobFairList(Model model) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());

        try {
            List<JobFairDTO> jobFair = jobFairService.getAllJobFair();
            model.addAttribute("jobFair", jobFair);

            String jobFairJson = mapper.writeValueAsString(jobFairService.getAllJobFair());
            model.addAttribute("jobFairJson", jobFairJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "jobfair/jobfair_list";
    }

    @GetMapping("/admin/jobfairdetail/{jobfair_no}")
    public String jobFairDetail(Model model, @PathVariable("jobfair_no") Long jobFairNo) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());

        try {
            JobFairDTO jobFair = jobFairService.getJobFairByNo(jobFairNo);
            model.addAttribute("jobFair", jobFair);

            String jobFairJson = mapper.writeValueAsString(jobFair);
            model.addAttribute("jobFairJson", jobFairJson);

            System.out.println(jobFair.getJOBFAIR_NO() + 3);
            System.out.println(jobFair);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "jobfair/jobfair_detail";
    }
}