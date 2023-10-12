package com.pickmeup.jobstartup.recruiter.jobposting.repository;

import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;
import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterMyPageDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface JobPostingRepository {
    //공고등록
    public void insertJobPostingDTO(JobPostingDTO jobPostingDTO) throws DataAccessException;

    //목록조회
    public List<JobPostingDTO> selectJPlist();

/*    public RecruiterMyPageDTO selectCompany();*/


    //공고상세조회
    public JobPostingDTO selectJPdetail (int posting_no);

    //상위지역(서울특별시, 부산광역시 등등, 지역 계층구조 1단계) 목록 가져오기
    public List<LocDTO> getUpperLoc();
    //상위지역에 따른 하위지역 목록(강동구, 강서구, 강남구 등등, 지역 계층구조 2단계) 가져오기
    public List<LocDTO> getLowerLoc(String upperLoc);

}
