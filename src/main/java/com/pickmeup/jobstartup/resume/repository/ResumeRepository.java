package com.pickmeup.jobstartup.resume.repository;

import com.pickmeup.jobstartup.resume.dto.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ResumeRepository {

    //이력서 목록 조회
    public List<ResumeDTO> selectResumeList ();

    //이력서 상세조회
    public ResumeDTO selectResumeDetail (int resume_no);

    //이력서 삭제
    public void deleteResume (int resume_no);

    //이력서 작성
    public int insertResume (ResumeDTO resumeDTO);
}
