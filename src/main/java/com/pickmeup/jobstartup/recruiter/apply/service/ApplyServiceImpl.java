package com.pickmeup.jobstartup.recruiter.apply.service;


import com.pickmeup.jobstartup.recruiter.apply.dao.ApplyRepositoryImpl;
import com.pickmeup.jobstartup.recruiter.apply.dto.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplyServiceImpl implements ApplyService {

    @Autowired
    private ApplyRepositoryImpl applyRepository;

    public  void insertInfo(ApplyDTO applyDTO) {
        System.out.println("service의 insertInfo까지는 왔다");
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

    public ApplyDTO getCompanyNo() {
        System.out.println("서비스에서 부르는company_no는 ~~~~~~~~" + applyRepository.getCompanyNo());
        return applyRepository.getCompanyNo();
    }

    public List<JobDTO> getBusiness_type_code_up(){
        return applyRepository.getBusiness_type_code_up();
    }

    public List<JobDTO> getBusiness_type_code(String business_type_code_up){
        return applyRepository.getBusiness_type_code(business_type_code_up);
    }

    public void insertTest(TestDTO testDTO){
        applyRepository.insertTest(testDTO);
    }

}
