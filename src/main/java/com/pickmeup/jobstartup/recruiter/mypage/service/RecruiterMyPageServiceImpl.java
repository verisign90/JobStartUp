package com.pickmeup.jobstartup.recruiter.mypage.service;

import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterCalendarDTO;
import com.pickmeup.jobstartup.recruiter.mypage.repository.RecruiterMyPageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RecruiterMyPageServiceImpl implements RecruiterMyPageService{

    @Autowired
    RecruiterMyPageRepository recruiterMyPageRepository;

    //기업 페이지: 회사 정보
    //기업 페이지: 1) 박람회 현황
    //기업 페이지: 2) 공고 관리
    //기업 페이지: 3) 지원자 관리
    //기업 페이지: 정보 수정
    //기업 페이지: 사진 수정
    //기업 페이지: pagination

    //기업 페이지: calendar 조회
    @Override
    public List<RecruiterCalendarDTO> selectRecruCalendar(int company_no){
        return recruiterMyPageRepository.selectRecruCalendar(company_no);
    }

    //기업 페이지: calendar 입력
    @Override
    public int insertRecruCalendar(RecruiterCalendarDTO recruiterCalendarDTO){




        return 0;
    }

    //기업 페이지: calendar 삭제
    //기업 페이지: calendar 수정

}
