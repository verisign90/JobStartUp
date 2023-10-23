package com.pickmeup.jobstartup.recruiter.apply.repository;

import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.member.entity.Member;
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


    public void deleteFile(int cfile_no);

    public int existCheck(String originalFilename, int company_no);

    public void updateInfo(ApplyDTO applyDTO);

    public Member getMemberNO(String memberId);

    public ApplyDTO getApplyDTO(int member_no);

    public void insertEntry(long jobfair_no, int company_no);

    public EntryDTO getEntry(int company_no);


    //회사번호로 회원번호 불러오기
    public long getMemberNoByCno(long companyNo);

    public void deleteEntry(int company_no);

    public int countEntry(int company_no);
}
