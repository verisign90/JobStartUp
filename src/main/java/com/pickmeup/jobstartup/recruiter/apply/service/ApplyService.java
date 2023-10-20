package com.pickmeup.jobstartup.recruiter.apply.service;


import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.recruiter.apply.dto.*;
import java.util.List;


public interface ApplyService {

    public List<LocDTO> getUpperLoc();

    public void insertInfo(ApplyDTO applyDTO);

    public List<LocDTO> getLowerLoc(String upperLoc);

    public void insertFile(List<FileDTO> fileDTOList);

    public ApplyDTO getCompanyNo();


    public List<JobDTO> getBusiness_type_code_up();

    public List<JobDTO> getBusiness_type_code(String business_type_code_up);

    public void insertTest(TestDTO testDTO);

    public ApplyDTO getCompanyList();

    public List<FileDTO> getFileList(int company_no);

    public ApplyDTO getCompanyInfo(int company_no);


    public void deleteFile(int cfileNo);

    public int existCheck(String originalFilename, int companyNo);

    public void updateInfo(ApplyDTO applyDTO);

    public Member getMemberNO(String memberId);

    public ApplyDTO getApplyDTO(int member_no);

    public void insertEntry(long jobfair_no, int company_no);

    public EntryDTO getEntry(int company_no);
}
