package com.pickmeup.jobstartup.admin.service;

import com.pickmeup.jobstartup.admin.dto.AgeGroupDTO;
import com.pickmeup.jobstartup.admin.dto.CountDataDTO;
import com.pickmeup.jobstartup.admin.dto.DashboardDTO;
import com.pickmeup.jobstartup.admin.dto.RegDateDTO;
import com.pickmeup.jobstartup.admin.repository.DashboardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DashboardService {

    @Autowired
    public DashboardRepository dashboardRepository;

    public List<DashboardDTO> getAllDashboardData() {
        return dashboardRepository.selectDashboardData();
    }

    public List<AgeGroupDTO> getAgeGroupData() {
        return dashboardRepository.selectAgeGroupData();
    }

    public List<RegDateDTO> getRegDate() {
        return dashboardRepository.selectRegDate();
    }

    public CountDataDTO getAllCountData(){
        return dashboardRepository.selectAllCountData();
    }
}
