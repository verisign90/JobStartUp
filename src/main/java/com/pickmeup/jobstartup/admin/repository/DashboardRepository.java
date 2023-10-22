package com.pickmeup.jobstartup.admin.repository;

import com.pickmeup.jobstartup.admin.dto.AgeGroupDTO;
import com.pickmeup.jobstartup.admin.dto.CountDataDTO;
import com.pickmeup.jobstartup.admin.dto.DashboardDTO;
import com.pickmeup.jobstartup.admin.dto.RegDateDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DashboardRepository {

    List<DashboardDTO> selectDashboardData();

    List<AgeGroupDTO> selectAgeGroupData();

    List<RegDateDTO> selectRegDate();

    CountDataDTO selectAllCountData();
}
