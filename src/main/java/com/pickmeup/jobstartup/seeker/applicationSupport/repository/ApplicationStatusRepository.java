package com.pickmeup.jobstartup.seeker.applicationSupport.repository;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.ResumeApplyDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Mapper
@Repository
public interface ApplicationStatusRepository {

    //지원하기
    public int insertResumeApply (Map<String, Integer> resumeApplyMap);
}
