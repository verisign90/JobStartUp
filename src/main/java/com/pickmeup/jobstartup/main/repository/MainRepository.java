package com.pickmeup.jobstartup.main.repository;

import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.main.dto.JobPostDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface MainRepository {
    public List<ApplyDTO> getCompanyList();

    public ApplyDTO getCompanyNO(int companyNo);

    public List<JobFairDTO> getJobFairList();

    public List<JobPostDTO> selectJobPost();
}
