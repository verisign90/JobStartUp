package com.pickmeup.jobstartup.resume.service;

import com.pickmeup.jobstartup.resume.dto.*;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public interface ResumeService {

    //이력서 목록조회
    public List<ResumeDTO> selectResumeList ();

    //이력서 상세조회
    public ResumeDTO selectResumeDetail (int resume_no);

    //이력서 삭제
    public void deleteResume (int resume_no);

    //이력서 작성
    public int insertResume (ResumeDTO resumeDTO);
}
