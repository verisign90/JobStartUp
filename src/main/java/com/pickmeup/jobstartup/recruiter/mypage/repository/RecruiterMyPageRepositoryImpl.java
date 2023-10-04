package com.pickmeup.jobstartup.recruiter.mypage.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecruiterMyPageRepositoryImpl {

    @Autowired
    private SqlSession sqlSession;


    //기업 페이지: 회사 정보
    //기업 페이지: 1) 박람회 현황
    //기업 페이지: 2) 공고 관리
    //기업 페이지: 3) 지원자 관리
    //기업 페이지: 정보 수정
    //기업 페이지: 사진 수정
    //기업 페이지: pagination


}
