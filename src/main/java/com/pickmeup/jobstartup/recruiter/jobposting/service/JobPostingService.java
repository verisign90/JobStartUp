package com.pickmeup.jobstartup.recruiter.jobposting.service;


import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;
import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterMyPageDTO;

import java.util.List;

public interface JobPostingService {

    //채용공고 작성
    public void write(JobPostingDTO jobPostingDTO) throws Exception;

    //채용공고 목록조회
    public List<JobPostingDTO> selectJPlist() throws Exception;

    /*RecruiterMyPageDTO selectCompany(int company_no) throws Exception;*/
/*    public RecruiterMyPageDTO selectCompany() throws Exception;*/

    //채용공고 상세조회
    public JobPostingDTO selectJPdetail (int posting_no) throws Exception;

    //상위지역 목록 가져오기
    List<LocDTO> getUpperLoc();

    //상위지역에 따른 하위지역 목록 가져오기
    List<LocDTO> getLowerLoc(String upperLoc);
}
