package com.pickmeup.jobstartup.seeker.applicationSupport.repository;

import com.pickmeup.jobstartup.recruiter.apply.dto.JobDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.ResumeApplyDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface ApplicationStatusRepository {

    //지원하기
    int insertResumeApply (Map<String, Integer> resumeApplyMap);

    //이력서 지원현황
    List<ResumeApplyDTO> selectApplyStatus (int member_no);

    //오늘 면접 조회
    List<ResumeApplyDTO> selectToday (int member_no);

    //예정 면접 조회
    List<ResumeApplyDTO> selectPlan (int member_no);

    //이력서 삭제시 지원도 delete
    int deleteApply (int resume_no);
}
