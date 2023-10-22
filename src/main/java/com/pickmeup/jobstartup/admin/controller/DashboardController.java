package com.pickmeup.jobstartup.admin.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pickmeup.jobstartup.admin.dto.AgeGroupDTO;
import com.pickmeup.jobstartup.admin.dto.CountDataDTO;
import com.pickmeup.jobstartup.admin.dto.DashboardDTO;
import com.pickmeup.jobstartup.admin.dto.RegDateDTO;
import com.pickmeup.jobstartup.admin.service.DashboardService;
import com.pickmeup.jobstartup.admin.service.EntryService;
import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.jobfair.service.JobFairService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class DashboardController {

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private DashboardService dashboardService;

    @Autowired
    private JobFairService jobFairService;


    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        ObjectMapper mapper = objectMapper;

        try {
            CountDataDTO countAllData = dashboardService.getAllCountData();
            List<DashboardDTO> dashboardData = dashboardService.getAllDashboardData();
            List<AgeGroupDTO> ageGroupData = dashboardService.getAgeGroupData();
            List<RegDateDTO> regDateData = dashboardService.getRegDate();

            model.addAttribute("countAllData", countAllData);
            model.addAttribute("dashboardData", dashboardData);
            model.addAttribute("ageGroupData", ageGroupData);
            model.addAttribute("regDateData", regDateData);

            String countAllDataJson = mapper.writeValueAsString(dashboardService.getAllCountData());
            String dashboardDataJson = mapper.writeValueAsString(dashboardService.getAllDashboardData());
            String ageGroupDataJson = mapper.writeValueAsString(dashboardService.getAgeGroupData());
            String regDateDataJson = mapper.writeValueAsString(dashboardService.getRegDate());

            model.addAttribute("countAllDataJson", countAllDataJson);
            model.addAttribute("dashboardDataJson", dashboardDataJson);
            model.addAttribute("ageGroupDataJson", ageGroupDataJson);
            model.addAttribute("regDateDataJson", regDateDataJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "admin/dashboard";
    }

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

}
