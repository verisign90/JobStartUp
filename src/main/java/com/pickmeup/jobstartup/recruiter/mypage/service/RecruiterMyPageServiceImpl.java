package com.pickmeup.jobstartup.recruiter.mypage.service;

import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;
import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterCalendarDTO;
import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterFileDTO;
import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterJobPostingDTO;
import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterMyPageDTO;
import com.pickmeup.jobstartup.recruiter.mypage.repository.RecruiterMyPageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class RecruiterMyPageServiceImpl implements RecruiterMyPageService{

    @Autowired
    private RecruiterMyPageRepository recruiterMyPageRepository;

    //Path
    private String commonPath = "C:/JobStartUp_fileUpload/recruiterApply/";

    //기업 페이지: 회사 정보
    @Override
    public RecruiterMyPageDTO selectRecruiterInfo(int company_no){
        return recruiterMyPageRepository.selectRecruiterInfo(company_no);
    };

    //기업 페이지: 1) 박람회 현황(Ajax) + pagination

    //기업 페이지: 2) 공고 관리(Ajax) + pagination
    @Override
    public List<RecruiterJobPostingDTO> getJobPostingList(int company_no){
        return recruiterMyPageRepository.getJobPostingList(company_no);
    }

    //기업 페이지: 3) 지원자 관리(Ajax) + pagination
    //기업 페이지: 정보 수정 리스트 (또는 approval 담당의 jsp 이용)
    //기업 페이지: 정보 수정 (또는 approval 담당의 jsp 이용)

    //기업 페이지: 파일 - 저장된 로고 이름 확인
    @Override
    public RecruiterFileDTO selectComLogoName(int company_no){
        return recruiterMyPageRepository.selectComLogoName(company_no);
    }

    //기업 페이지: 파일 - 로고 수정(원본 삭제, 파일 업로드)
    @Override
    public int updateComLogo(MultipartFile logoFile, int company_no, String savedSavname){
        if (!logoFile.isEmpty()) {
            //1. 삭제: Logo Delete (saved file delete)
            String DeletefilePath = commonPath + File.separator + savedSavname;
            File fileToDelete = new File(DeletefilePath);
            fileToDelete.delete();
            //2. 업로드: Logo Upload (new file uploaded)
            String uuid = UUID.randomUUID().toString();
            String logo_orgname = logoFile.getOriginalFilename();
            String logo_savname = uuid + logo_orgname;
            String uploadfilePath = commonPath + File.separator + logo_savname;
            File file = new File(uploadfilePath);
            try {
                logoFile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            RecruiterFileDTO recruiterFileDTO = new RecruiterFileDTO();
            recruiterFileDTO.setLogo_orgname(logo_orgname);
            recruiterFileDTO.setLogo_savname(logo_savname);
            recruiterFileDTO.setCompany_no(company_no);
            return recruiterMyPageRepository.updateComLogo(recruiterFileDTO);
        } else {
            return 0;
        }
    }

    //기업 페이지: calendar 조회
    @Override
    public List<RecruiterCalendarDTO> selectRecruCalendar(){
        return recruiterMyPageRepository.selectRecruCalendar();
    }

    //기업 페이지: calendar 입력
    @Override
    public int insertRecruCalendar(RecruiterCalendarDTO recruiterCalendarDTO){
        //schedule_end 특정 위치 값 변경 (+1) : calendar 마지막 날 exclusive 되는 문제 해결
        String orgEndDate = recruiterCalendarDTO.getSchedule_end();
        // 시작 인덱스를 8로 변경
        int subEndDate = Integer.parseInt(orgEndDate.substring(8));
        int addEndDate = subEndDate + 1;
        String strSubEndDate = Integer.toString(addEndDate);
        // 시작 인덱스를 0으로 변경
        String editedEndDate = orgEndDate.substring(0, 8) + strSubEndDate;
        recruiterCalendarDTO.setSchedule_end(editedEndDate);
        return recruiterMyPageRepository.insertRecruCalendar(recruiterCalendarDTO);
    }

    //기업 페이지: calendar 삭제
    //기업 페이지: calendar 수정

}
