package com.pickmeup.jobstartup.jobfair.repository;

import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface JobFairRepository {

    List<JobFairDTO> selectJobFairList();

    JobFairDTO selectJobFairByNo(Long jobFairNo);
}
