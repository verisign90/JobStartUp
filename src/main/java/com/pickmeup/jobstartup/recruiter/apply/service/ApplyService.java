package com.pickmeup.jobstartup.recruiter.apply.service;


import com.pickmeup.jobstartup.recruiter.apply.dto.*;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ApplyService {

    public List<LocDTO> getUpperLoc();

    public void insertInfo(ApplyDTO applyDTO);

    public List<LocDTO> getLowerLoc(String upperLoc);

    public void insertFile(List<FileDTO> fileDTOList);

    public ApplyDTO getCompanyNo();


    public List<JobDTO> getBusiness_type_code_up();

    public List<JobDTO> getBusiness_type_code(String business_type_code_up);

    public void insertTest(TestDTO testDTO);
}
