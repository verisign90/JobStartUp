package com.pickmeup.jobstartup.admin.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pickmeup.jobstartup.admin.dto.AgeGroupDTO;
import com.pickmeup.jobstartup.admin.dto.DashboardDTO;
import com.pickmeup.jobstartup.admin.dto.RegDateDTO;
import com.pickmeup.jobstartup.admin.service.DashboardService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class DashboardController {

    @Autowired
    private ObjectMapper objectMapper;

    private final DashboardService dashboardService;

    @GetMapping("/admin/dashboard")
    public String dashboard(Model model) {
        ObjectMapper mapper = objectMapper;

        try {
            List<DashboardDTO> dashboardData = dashboardService.getAllDashboardData();
            List<AgeGroupDTO> ageGroupData = dashboardService.getAgeGroupData();
            List<RegDateDTO> regDateData = dashboardService.getRegDate();

            model.addAttribute("dashboardData", dashboardData);
            model.addAttribute("ageGroupData", ageGroupData);
            model.addAttribute("regDateData", regDateData);

            String dashboardDataJson = mapper.writeValueAsString(dashboardService.getAllDashboardData());
            String ageGroupDataJson = mapper.writeValueAsString(dashboardService.getAgeGroupData());
            String regDateDataJson = mapper.writeValueAsString(dashboardService.getRegDate());

            model.addAttribute("dashboardDataJson", dashboardDataJson);
            model.addAttribute("ageGroupDataJson", ageGroupDataJson);
            model.addAttribute("regDateDataJson", regDateDataJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "admin/dashboard";
    }
}
