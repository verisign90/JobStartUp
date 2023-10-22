package com.pickmeup.jobstartup.jobfair.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.jobfair.service.JobFairService;
import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/jobfair")
public class JobFairController {

    private final JobFairService jobFairService;

    @GetMapping("/list")
    public String jobFairList(@RequestParam(value = "page", defaultValue = "1") int page,
                              @RequestParam(value = "size", defaultValue = "10") int size, Model model) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());

        try {
            Map<String, Object> paginationResult = jobFairService.getAllJobFair(page, size);
            List<JobFairDTO> jobFair = (List<JobFairDTO>) paginationResult.get("jobFairList");
            int totalPages = (int) paginationResult.get("totalPages");

            model.addAttribute("jobFair", jobFair);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("currentPage", page);

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

    @GetMapping("/entry/form")
    public String jobFairForm(@RequestParam(name = "jobFairNo") Long jobFairNo, HttpServletRequest request, Model model) {
        Long memberNo = null;
        Object memberNoObj = request.getSession().getAttribute("memberNo");
        if (memberNoObj != null) {
            String memberNoStr = memberNoObj.toString();
            if (memberNoStr.matches("\\d+")) {
                memberNo = Long.valueOf(memberNoStr);
            }
        }

        Long companyNo = null;
        Object companyNoObj = request.getSession().getAttribute("companyNo");
        if (companyNoObj != null) {
            String companyNoStr = companyNoObj.toString();
            if (companyNoStr.matches("\\d+")) {
                companyNo = Long.valueOf(companyNoStr);
            }
        }

        if (companyNo != null) {
            ApplyDTO companyInfo = jobFairService.findCompanyByMemberNo(memberNo);
            model.addAttribute("companyInfo", companyInfo);
        }

        return "jobfair/approvalRequest";
    }

    @PostMapping("/entry")
    public String entryCompany(@ModelAttribute ApplyDTO companyDTO) {
        jobFairService.insertJobFairEntry(companyDTO);

        return "jobfair/jobfair_listist";
    }
}