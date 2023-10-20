package com.pickmeup.jobstartup.jobfair.repository;

import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairFileDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface JobFairRepository {

    List<JobFairDTO> selectJobFairList();

    JobFairDTO selectJobFairByNo(Long jobFairNo);

    List<EntryDTO> selectEntryDTOList();

    List<EntryDTO> selectEntryDTOListByNo(Long JobFairNo);

    Long writeJobFair(JobFairDTO jobFairDTO);

    void save(JobFairFileDTO jobFairFileDTO);

    void updateJobFair(JobFairDTO jobFairDTO);

    void delete(Long no);

    List<JobFairDTO> paginationJobFair(Map<String, Integer> params);

    int countJobFair();

    void insertEntryJobFair(Long jobFairNo, Long memberNo, Long companyNo);

    ApplyDTO findCompanyByMemberNo(Long memberNo);
}
