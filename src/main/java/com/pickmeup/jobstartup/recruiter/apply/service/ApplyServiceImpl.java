package com.pickmeup.jobstartup.recruiter.apply.service;


import com.pickmeup.jobstartup.recruiter.apply.dao.ApplyRepositoryImpl;
import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.FileDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplyServiceImpl {

    @Autowired
    private ApplyRepositoryImpl applyRepository;

    public  void insertInfo(ApplyDTO applyDTO) {
        applyRepository.insertInfo(applyDTO);

    }

    public List<LocDTO> getUpperLoc() {
        return applyRepository.getUpperLoc();

    }
    public List<LocDTO> getLowerLoc(String upperLoc) {
        return applyRepository.getLowerLoc(upperLoc);
    }

    public void insertFile(List<FileDTO> fileDTOList) {
        for (FileDTO fileDTO : fileDTOList) {
            applyRepository.insertFile(fileDTO);
        }

    }

    public void getCompanyNo() {

    }
}
