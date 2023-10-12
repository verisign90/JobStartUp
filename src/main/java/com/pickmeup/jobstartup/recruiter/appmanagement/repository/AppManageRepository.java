package com.pickmeup.jobstartup.recruiter.appmanagement.repository;

import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppManageDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppResumeDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppResumeFileDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AppManageRepository {

    //채용관리 지원자 상세 페이지: 1) 지원자 인적 정보
    AppManageDTO selectAppInfoByMember(int status_no);

    //채용관리 지원자 상세 페이지: 2) 지원자 이력 정보
    AppResumeDTO selectAppResumeByMember(int resume_no);

    //채용관리 지원자 상세 페이지: 2) 지원자 이력 정보 - 파일(사진,이력서)
    AppResumeFileDTO selectAppResumeFileByMember(int resume_no);


    //채용관리 지원자 상세 페이지: 1차 면접일자 등록
    int updateAppManageFirstEnroll(AppManageDTO appManageDTO);

    //채용관리 지원자 상세 페이지: 1차 면접일자 반려
    int updateAppManageFirstDenial(int status_no);

    //채용관리 지원자 상세 페이지: 최종 면접일자 승인
    int updateAppManageLastEnroll(int status_no);

    //채용관리 지원자 상세 페이지: 최종 면접일자 반려
    int updateAppManageLastDenial(int status_no);

    //채용관리 지원자 상세 페이지: 1차 메일링(안내)


    //채용관리 지원자 상세 페이지: 최종 메일링(안내)



}
