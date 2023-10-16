package com.pickmeup.jobstartup.recruiter.apply.repository;

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

    public ApplyDTO getCompanyList();

    public List<FileDTO> getFileList(int company_no);

    public ApplyDTO getCompanyInfo(int company_no);



}
