package com.pickmeup.jobstartup.recruiter.mypage.repository;

import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppManageDTO;
import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterCalendarDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Mapper
@Repository
public interface RecruiterMyPageRepository {

    //기업 페이지: 회사 정보
    AppManageDTO selectRecruiterInfo(int company_no);

    //기업 페이지: 1) 박람회 현황
    //기업 페이지: 2) 공고 관리
    //기업 페이지: 3) 지원자 관리
    //기업 페이지: 정보 수정
    //기업 페이지: 사진 수정
    //기업 페이지: pagination

    //기업 페이지: calendar 조회
    List<RecruiterCalendarDTO> selectRecruCalendar(int company_no);

    //기업 페이지: calendar 입력
    int insertRecruCalendar(RecruiterCalendarDTO recruiterCalendarDTO);

    //기업 페이지: calendar 수정


    //기업 페이지: calendar 삭제


}
