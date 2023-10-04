package com.pickmeup.jobstartup.admin.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pickmeup.jobstartup.admin.dto.AgeGroupDTO;
import com.pickmeup.jobstartup.admin.dto.DashboardDTO;
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

    private final DashboardService dashboardService;

    @GetMapping("/admin/dashboard")
    public String dashboard(Model model) {
        ObjectMapper mapper = new ObjectMapper();

        try {
            List<DashboardDTO> dashboardData = dashboardService.getAllDashboardData();
            List<AgeGroupDTO> ageGroupData = dashboardService.getAgeGroupData();

            model.addAttribute("dashboardData", dashboardData);
            model.addAttribute("ageGroupData", ageGroupData);

            String dashboardDataJson = mapper.writeValueAsString(dashboardService.getAllDashboardData());
            String ageGroupDataJson = mapper.writeValueAsString(dashboardService.getAgeGroupData());

            model.addAttribute("dashboardDataJson", dashboardDataJson);
            model.addAttribute("ageGroupDataJson", ageGroupDataJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "admin/dashboard";
    }
}
