package com.pickmeup.jobstartup.jobfair.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.jobfair.service.JobFairService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class JobFairController {

    private final JobFairService jobFairService;

    //Call JobFairList
    @GetMapping("/jobfairlist")
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

    //Call JobFairDetail
    @GetMapping("/jobfairdetail/{jobfair_no}")
    public String jobFairDetail(Model model, @PathVariable("jobfair_no") Long jobFairNo) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());

        try {
            JobFairDTO jobFair = jobFairService.getJobFairByNo(jobFairNo);
            model.addAttribute("jobFair", jobFair);

            String jobFairJson = mapper.writeValueAsString(jobFair);
            model.addAttribute("jobFairJson", jobFairJson);

            List<EntryDTO> entryDTOList = jobFairService.getEntryDTOListByNo(jobFairNo);
            model.addAttribute("entryCompany", entryDTOList);
            System.out.println(entryDTOList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "jobfair/jobfair_detail";
    }

    @GetMapping("/jobfair/write")
    public String jobFairWrite(Model model) {
        return "jobfair/jobfair_write";
    }

    @PostMapping("/jobfair/save")
    public String write(@ModelAttribute JobFairDTO jobFairDTO, @RequestParam(name = "images", required = false) List<MultipartFile> images) {
        System.out.println("save: " + jobFairDTO.getJOBFAIR_SDATE());

        System.out.println("save: " + jobFairDTO.getJOBFAIR_CONTENT().toString());

        jobFairService.writeJobFair(jobFairDTO);


        return "redirect:/admin/jobfairlist";
    }

}