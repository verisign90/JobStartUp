package com.pickmeup.jobstartup.jobfair.service;

import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairFileDTO;
import com.pickmeup.jobstartup.jobfair.repository.JobFairRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobFairService {

    @Autowired
    public JobFairRepository jobFairRepository;

    public List<JobFairDTO> getAllJobFair() {
        return jobFairRepository.selectJobFairList();
    }

    public JobFairDTO getJobFairByNo(Long jobFairNo) {
        return jobFairRepository.selectJobFairByNo(jobFairNo);
    }

    public List<EntryDTO> getEntryDTOListByNo(Long jobFairNo) {
        return jobFairRepository.selectEntryDTOListByNo(jobFairNo);
    }

    public void writeJobFair(JobFairDTO jobFairDTO) {
        jobFairRepository.writeJobFair(jobFairDTO);
    }

    public void save(JobFairFileDTO image) {
        jobFairRepository.save(image);
    }

}
