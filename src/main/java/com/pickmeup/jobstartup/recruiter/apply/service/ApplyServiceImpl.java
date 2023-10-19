package com.pickmeup.jobstartup.recruiter.apply.service;


import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.recruiter.apply.dto.*;

import com.pickmeup.jobstartup.recruiter.apply.repository.ApplyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplyServiceImpl implements ApplyService {

    @Autowired
    private ApplyRepository applyRepository;

    @Override
    public  void insertInfo(ApplyDTO applyDTO) {
        System.out.println("service의 insertInfo까지는 왔다");
        applyRepository.insertInfo(applyDTO);

    }

    @Override
    public List<LocDTO> getUpperLoc() {
        return applyRepository.getUpperLoc();

    }
    @Override
    public List<LocDTO> getLowerLoc(String upperLoc) {
        return applyRepository.getLowerLoc(upperLoc);
    }

    @Override
    public void insertFile(List<FileDTO> fileDTOList) {
        for (FileDTO fileDTO : fileDTOList) {
            applyRepository.insertFile(fileDTO);
        }

    }

    @Override
    public ApplyDTO getCompanyNo() {
        System.out.println("서비스에서 부르는company_no는 ~~~~~~~~" + applyRepository.getCompanyNo());
        return applyRepository.getCompanyNo();
    }

    @Override
    public List<JobDTO> getBusiness_type_code_up(){
        return applyRepository.getBusiness_type_code_up();
    }

    @Override
    public List<JobDTO> getBusiness_type_code(String business_type_code_up){
        return applyRepository.getBusiness_type_code(business_type_code_up);
    }

    @Override
    public void insertTest(TestDTO testDTO){
        applyRepository.insertTest(testDTO);
    }

    @Override
    public ApplyDTO getCompanyList(){
        return applyRepository.getCompanyList();
    }

    @Override
    public List<FileDTO> getFileList(int company_no){
        return applyRepository.getFileList(company_no);
    }

    @Override
    public ApplyDTO getCompanyInfo(int company_no){return applyRepository.getCompanyInfo(company_no);}

    public void deleteFile(int cfile_no){applyRepository.deleteFile(cfile_no);}

    public int existCheck(String originalFilename, int company_no){return applyRepository.existCheck(originalFilename,company_no);}

    public void updateInfo(ApplyDTO applyDTO){applyRepository.updateInfo(applyDTO);}

    public Member getMemberNO(String memberId){return applyRepository.getMemberNO(memberId);}

    public ApplyDTO getApplyDTO(int member_no){return applyRepository.getApplyDTO(member_no);}

    public void insertEntry(long jobfair_no, int company_no){applyRepository.insertEntry(jobfair_no,company_no);}

}

