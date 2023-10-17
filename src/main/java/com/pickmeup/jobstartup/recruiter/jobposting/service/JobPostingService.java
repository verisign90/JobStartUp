package com.pickmeup.jobstartup.recruiter.jobposting.service;


import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;

import java.util.List;
import java.util.Map;

public interface JobPostingService {

    //채용공고 작성
    public void write(JobPostingDTO jobPostingDTO) throws Exception;

    //채용공고 목록조회
    public List<JobPostingDTO> selectJPlist() throws Exception;

    //채용공고 상세조회
    public JobPostingDTO selectJPdetail (int posting_no) throws Exception;

    //채용공고 수정
    public void modify (Map<String, Object> map) throws Exception;

    //공고 삭제
    public void delete(int posting_no) throws Exception;

    //상위지역 목록 가져오기
    List<LocDTO> getUpperLoc();

    //상위지역에 따른 하위지역 목록 가져오기
    List<LocDTO> getLowerLoc(String upperLoc);
}
