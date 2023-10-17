package com.pickmeup.jobstartup.recruiter.mypage.service;

import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.recruiter.mypage.dto.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface RecruiterMyPageService {

    //기업 페이지: 회사 정보
    RecruiterMyPageDTO selectRecruiterInfo(int company_no);

    //기업 페이지: 1) 박람회 현황(Ajax) + pagination
    List<RecruiterJobFairDTO> getJobFairList(RecruiterCriteria criteria);
    int getJobFairCount(RecruiterCriteria criteria);

    //기업 페이지: 2) 공고 관리(Ajax) + pagination
    List<RecruiterJobPostingDTO> getJobPostingList(RecruiterCriteria criteria);
    int getJobPostingCount(RecruiterCriteria criteria);







    //기업 페이지: 3) 지원자 관리(Ajax) + pagination
    //기업 페이지: 정보 수정 리스트 (또는 approval 담당의 jsp 이용)
    //기업 페이지: 정보 수정 (또는 approval 담당의 jsp 이용)

    //기업 페이지: 파일 - 저장된 로고 이름 확인
    RecruiterFileDTO selectComLogoName(int company_no);

    //기업 페이지: 파일 수정(원본 삭제, 파일 업로드)
    int updateComLogo(MultipartFile logoFile, int company_no, String savedSavname);

    //기업 페이지: calendar 조회
    List<RecruiterCalendarDTO> selectRecruCalendar();

    //기업 페이지: calendar 입력
    int insertRecruCalendar(RecruiterCalendarDTO recruiterCalendarDTO);

    //기업 페이지: calendar 삭제
    int deleteRecruCalendar(RecruiterCalendarDTO recruiterCalendarDTO);

    //기업 페이지: calendar 수정
}
