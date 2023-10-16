package com.pickmeup.jobstartup.jobfair.repository;

import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairFileDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

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

}
