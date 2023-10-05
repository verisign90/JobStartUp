package com.pickmeup.jobstartup.recruiter.apply.service;


import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.FileDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ApplyService {

    public List<LocDTO> getUpperLoc();

    public void insertInfo(ApplyDTO applyDTO);

    public List<LocDTO> getLowerLoc(String upperLoc);

    public void insertFile(List<FileDTO> fileDTOList);

    public void getCompanyNo();


}
