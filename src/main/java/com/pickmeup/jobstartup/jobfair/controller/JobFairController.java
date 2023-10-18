package com.pickmeup.jobstartup.jobfair.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.jobfair.service.JobFairService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/jobfair")
public class JobFairController {

    private final JobFairService jobFairService;

    @GetMapping("/list")
    public String jobFairList(Model model) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());
        System.out.println();

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
    @GetMapping("/detail/{jobfair_no}")
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
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "jobfair/jobfair_detail";
    }

    @GetMapping("/write")
    public String writeJobFair(Model model) {
        return "jobfair/jobfair_write";
    }

    @PostMapping("/write/save")
    public String write(@ModelAttribute JobFairDTO jobFairDTO) {
        System.out.println("content: " + jobFairDTO.getJOBFAIR_CONTENT());
        jobFairService.writeJobFair(jobFairDTO);

        return "redirect:/admin/jobfairlist";
    }

    @GetMapping("/write/edit")
    public String editJobFair(@RequestParam("jobFairNo") Long jobFairNo, Model model) {
        JobFairDTO jobFair = jobFairService.getJobFairByNo(jobFairNo);
        model.addAttribute("jobFair", jobFair);

        return "jobfair/jobfair_edit";
    }

    @PostMapping("/write/update")
    public String updateJobFair(@ModelAttribute JobFairDTO jobFairDTO) {
        jobFairService.updateJobFair(jobFairDTO);

        return "redirect:/admin/jobfairdetail/" + jobFairDTO.getJOBFAIR_NO();
    }

    @GetMapping("/delete")
    public String deleteJobFair(@RequestParam("jobFairNo") Long jobFairNo) {
        jobFairService.delteJobFair(jobFairNo);

        return "redirect:/admin/jobfairlist";
    }

    @GetMapping("/write/companylist")
    public String jobFairCompanyList(Model model) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());


        try {
            List<EntryDTO> companies = jobFairService.getAllCompany();
            model.addAttribute("company", companies);

            String companyJson = mapper.writeValueAsString(jobFairService.getAllCompany());
            model.addAttribute("companyJson", companyJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "jobfair/jobfair_company_list";
    }

    @PostMapping("/entry")
    public void entryJobFair(Long jobFairNo, String memberId) {
    }
}