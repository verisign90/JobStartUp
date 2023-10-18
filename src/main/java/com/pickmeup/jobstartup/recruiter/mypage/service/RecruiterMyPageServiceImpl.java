package com.pickmeup.jobstartup.recruiter.mypage.service;

import com.pickmeup.jobstartup.recruiter.mypage.dto.*;
import com.pickmeup.jobstartup.recruiter.mypage.repository.RecruiterMyPageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
    private String commonPath = "C:/JobStartUp_fileUpload/company/logo/";

    //기업 페이지: 회사 정보
    @Override
    @Transactional
    public RecruiterMyPageDTO selectRecruiterInfo(int company_no){
        return recruiterMyPageRepository.selectRecruiterInfo(company_no);
    };

    //기업 페이지: 박람회 현황 + pagination
    @Override
    @Transactional
    public List<RecruiterJobFairDTO> getJobFairList(RecruiterCriteria criteria) {
        return  recruiterMyPageRepository.getJobFairList(criteria);
    }
    @Override
    @Transactional
    public int getJobFairCount(RecruiterCriteria criteria) {
        return recruiterMyPageRepository.getJobFairCount(criteria);
    }

    //기업 페이지: 공고 관리 + pagination
    @Override
    @Transactional
    public List<RecruiterJobPostingDTO> getJobPostingList(RecruiterCriteria criteria){
        return  recruiterMyPageRepository.getJobPostingList(criteria);
    }
    @Override
    @Transactional
    public int getJobPostingCount(RecruiterCriteria criteria) {
        return recruiterMyPageRepository.getJobPostingCount(criteria);
    }

    //기업 페이지: 지원자 관리 + pagination
    @Override
    @Transactional
    public List<RecruiterAppManageDTO> getAppList(RecruiterCriteria criteria){
        return recruiterMyPageRepository.getAppList(criteria);
    }
    @Override
    @Transactional
    public int getAppListCount(RecruiterCriteria criteria){
        return recruiterMyPageRepository.getAppListCount(criteria);
    }



    //기업 페이지: 정보 수정 리스트 (또는 approval 담당의 jsp 이용)
    //기업 페이지: 정보 수정 (또는 approval 담당의 jsp 이용)

    //기업 페이지: 파일 - 저장된 로고 이름 확인
    @Override
    @Transactional
    public RecruiterFileDTO selectComLogoName(int company_no){
        return recruiterMyPageRepository.selectComLogoName(company_no);
    }

    //기업 페이지: 파일 - 로고 수정(원본 삭제, 파일 업로드)
    @Override
    @Transactional
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
    @Transactional
    public List<RecruiterCalendarDTO> selectRecruCalendar(){
        return recruiterMyPageRepository.selectRecruCalendar();
    }

    //기업 페이지: calendar 입력
    @Override
    @Transactional
    public int insertRecruCalendar(RecruiterCalendarDTO recruiterCalendarDTO){
        return recruiterMyPageRepository.insertRecruCalendar(insertEditEndDate(recruiterCalendarDTO));
    }

    //기업 페이지: calendar 삭제
    @Override
    @Transactional
    public int deleteRecruCalendar(RecruiterCalendarDTO recruiterCalendarDTO) {
        return recruiterMyPageRepository.deleteRecruCalendar(deleteEditEndDate(recruiterCalendarDTO));
    }

    //기업 페이지: calendar - calendar 마지막 날 exclusive 되는 문제 해결
    protected RecruiterCalendarDTO insertEditEndDate(RecruiterCalendarDTO recruiterCalendarDTO){
        String orgEndDate = recruiterCalendarDTO.getSchedule_end();
        int subEndDate = Integer.parseInt(orgEndDate.substring(8));
        int addEndDate = subEndDate + 1;
        String strSubEndDate = Integer.toString(addEndDate);
        if( subEndDate < 10 ) {
            String editedEndDate = orgEndDate.substring(0, 8) + "0" + strSubEndDate;
            recruiterCalendarDTO.setSchedule_end(editedEndDate);
        } else {
            String editedEndDate = orgEndDate.substring(0, 8) + strSubEndDate;
            recruiterCalendarDTO.setSchedule_end(editedEndDate);
        }
        return recruiterCalendarDTO;
    }

    //기업 페이지: calendar - calendar 시작일 exclusive 되는 문제 해결
    protected RecruiterCalendarDTO deleteEditEndDate(RecruiterCalendarDTO recruiterCalendarDTO){
        String orgEndDate = recruiterCalendarDTO.getSchedule_end();
        int subEndDate = Integer.parseInt(orgEndDate.substring(8,10));
        int addEndDate = subEndDate + 1;
        String strSubEndDate = Integer.toString(addEndDate);
        if( subEndDate < 10 ) {
            String editedEndDate = orgEndDate.substring(0, 8) + "0" + strSubEndDate;
            recruiterCalendarDTO.setSchedule_end(editedEndDate);
        } else {
            String editedEndDate = orgEndDate.substring(0, 8) + strSubEndDate;
            recruiterCalendarDTO.setSchedule_end(editedEndDate);
        }
        return recruiterCalendarDTO;
    }

    //기업 페이지: calendar 수정


}
