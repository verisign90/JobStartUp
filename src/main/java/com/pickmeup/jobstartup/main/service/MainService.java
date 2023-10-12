package com.pickmeup.jobstartup.main.service;

import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MainService {

    public List<ApplyDTO> getCompanyList();

    public ApplyDTO getCompanyNO(int companyNo);

    public List<JobFairDTO> getJobFairList();
}
