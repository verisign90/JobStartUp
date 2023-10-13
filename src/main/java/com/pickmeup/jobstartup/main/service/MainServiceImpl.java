package com.pickmeup.jobstartup.main.service;

import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.main.repository.MainRepository;
import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainServiceImpl implements MainService {
    @Autowired
    private MainRepository mainRepository;
    public List<ApplyDTO> getCompanyList() {
        return mainRepository.getCompanyList();
    }

    public ApplyDTO getCompanyNO(int companyNo){
        return mainRepository.getCompanyNO(companyNo);
    }

    public List<JobFairDTO> getJobFairList(){
        return mainRepository.getJobFairList();
    }


}
