package com.pickmeup.jobstartup.jobfair.service;

import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairFileDTO;
import com.pickmeup.jobstartup.jobfair.repository.JobFairRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JobFairService {

    @Autowired
    public JobFairRepository jobFairRepository;

    public List<JobFairDTO> getAllJobFair() {
        return jobFairRepository.selectJobFairList();
    }

    public List<EntryDTO> getAllCompany() {
        return jobFairRepository.selectEntryDTOList();
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

    public void updateJobFair(JobFairDTO jobFairDTO) {
        jobFairRepository.updateJobFair(jobFairDTO);
    }

    public void save(JobFairFileDTO image) {
        jobFairRepository.save(image);
    }

    public void delteJobFair(Long no) {
        jobFairRepository.delete(no);
    }

    public void insertJobFairEntry(Long jobFairNo, Long memberNo, Long companyNo){
        System.out.println("companyNo: " + companyNo);
        jobFairRepository.insertEntryJobFair(jobFairNo, memberNo, companyNo);
    }
    //page : 현재 페이지, size : 페이지당 게시물 수
    public Map<String, Object> getAllJobFair(int page, int size) {
        int offset = (page - 1) * size;

        Map<String, Integer> paramMap = new HashMap<>();
        paramMap.put("offset", offset);
        paramMap.put("size", size);

        List<JobFairDTO> jobFairList = jobFairRepository.paginationJobFair(paramMap);
        int totalCount = jobFairRepository.countJobFair();
        int totalPages = (int) Math.ceil((double) totalCount / size);

        Map<String, Object> result = new HashMap<>();
        result.put("jobFairList", jobFairList);
        result.put("totalPages", totalPages);
        return result;
    }
}
