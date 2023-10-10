package com.pickmeup.jobstartup.recruiter.apply.dao;

import com.pickmeup.jobstartup.recruiter.apply.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ApplyRepository {

    public void insertInfo(ApplyDTO applyDTO);

    public List<LocDTO> getUpperLoc();

    public List<LocDTO> getLowerLoc(String upperLoc);

    public void insertFile(FileDTO fileDTO);

    public ApplyDTO getCompanyNo();

    public List<JobDTO> getBusiness_type_code_up();

    public List<JobDTO> getBusiness_type_code(String business_type_code);

    public void insertTest(TestDTO testDTO);
}
