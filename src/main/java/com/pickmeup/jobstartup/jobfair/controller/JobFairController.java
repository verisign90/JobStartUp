package com.pickmeup.jobstartup.jobfair.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.jobfair.service.JobFairService;
import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.member.entity.MemberType;
import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import static com.pickmeup.jobstartup.member.entity.MemberType.COMPANY;
import static com.pickmeup.jobstartup.member.entity.MemberType.UNAPPROVED_COMPANY;

@Controller
@RequiredArgsConstructor
@RequestMapping("/jobfair")
public class JobFairController {

    private final JobFairService jobFairService;

    @GetMapping("/list")
    public String jobFairList(@RequestParam(value = "page", defaultValue = "1") int page,
                              @RequestParam(value = "size", defaultValue = "3") int size, Model model) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());

        try {
            Map<String, Object> paginationResult = jobFairService.getAllJobFair(page, size);
            List<JobFairDTO> jobFair = (List<JobFairDTO>) paginationResult.get("jobFairList");
            int totalPages = (int) paginationResult.get("totalPages");

            model.addAttribute("jobFair", jobFair);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("currentPage", page);
            System.out.println("Job Fair List: " + jobFair);
            System.out.println("Total Pages: " + totalPages);
            System.out.println("Current Page: " + page);

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

    @GetMapping("/companylist")
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
    public void entryJobFair(Long jobFairNo, Long memberNo, Long companyNo) {
        System.out.println("JFNO: " + jobFairNo + " | memberNo: " + memberNo + " | companyNo: " + companyNo);
        if (companyNo != null){
            jobFairService.insertJobFairEntry(jobFairNo, memberNo, companyNo);
        }else {
            System.out.println("회사 정보 입력 요망");
        }
    }



}