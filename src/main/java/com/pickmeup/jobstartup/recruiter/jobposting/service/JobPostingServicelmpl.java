package com.pickmeup.jobstartup.recruiter.jobposting.service;

import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;
import com.pickmeup.jobstartup.recruiter.jobposting.repository.JobPostingRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class JobPostingServicelmpl implements JobPostingService{

    private final JobPostingRepository jobPostingRepository;

    //공고작성
    @Override
    public void write(JobPostingDTO jobPostingDTO) throws Exception {
        jobPostingRepository.insertJobPostingDTO(jobPostingDTO);
    }

    //채용공고 목록조회
    @Override
    public List<JobPostingDTO> selectJPlist(){
        return jobPostingRepository.selectJPlist();
    }


    //공고상세조회
    @Override
    public JobPostingDTO selectJPdetail(int posting_no)  {
        JobPostingDTO jobPostingDTO = jobPostingRepository.selectJPdetail(posting_no);
        return jobPostingDTO;
    }

    //공고수정
    @Override
    public void modify(JobPostingDTO jobPostingDTO) throws Exception {

    }

    //상위 지역 리스트 가져오기
    @Override
    public List<LocDTO> getUpperLoc() {
        List<LocDTO> upperLoc = jobPostingRepository.getUpperLoc();
        System.out.println("서비스 upperLoc = " + upperLoc);
        return upperLoc;
    }

    //상위 지역에 따른 하위 지역 리스트 가져오기
    @Override
    public List<LocDTO> getLowerLoc(String upperLoc) {
        List<LocDTO> lowerLoc = jobPostingRepository.getLowerLoc(upperLoc);
        return lowerLoc;
    }
}
