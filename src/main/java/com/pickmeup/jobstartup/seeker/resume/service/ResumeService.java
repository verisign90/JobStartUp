package com.pickmeup.jobstartup.seeker.resume.service;

import com.pickmeup.jobstartup.seeker.resume.dto.ResumeDTO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
public interface ResumeService {

    //이력서 목록조회
    public List<ResumeDTO> selectResumeList ();

    //이력서 상세조회
    public ResumeDTO selectResumeDetail (int resume_no);

    //이력서 삭제
    public void deleteResume (int resume_no);

    //이력서 부속테이블 삭제
    public void deleteResumeAttached (int resume_no, int lang_no);

    //이력서 작성
    public int insertResume (ResumeDTO resumeDTO, MultipartFile profileOrgNameFile, MultipartFile resumeOrgNameFile) throws IOException;

    //이력서 부속테이블 작성
    public void insertResumeAttached (ResumeDTO resumeDTO, MultipartFile profileOrgNameFile, MultipartFile resumeOrgNameFile) throws IOException;

    //이력서 수정
    public void modifyResume (int resume_no, ResumeDTO modifuResumeDTO, MultipartFile profileOrgNameFile, MultipartFile resumeOrgNameFile);
}
