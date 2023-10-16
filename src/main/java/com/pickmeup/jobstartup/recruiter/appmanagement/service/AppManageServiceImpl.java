package com.pickmeup.jobstartup.recruiter.appmanagement.service;

import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppManageDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppResumeDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppResumeFileDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.repository.AppManageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@RequiredArgsConstructor
public class AppManageServiceImpl implements AppManageService{

    @Autowired
    private AppManageRepository appManageRepository;

    //채용관리 지원자 상세 페이지: 1) 지원자 인적 정보
    @Override
    @Transactional
    public AppManageDTO selectAppInfoByMember(int status_no) {
        return appManageRepository.selectAppInfoByMember(status_no);
    }

    //채용관리 지원자 상세 페이지: 2) 지원자 이력 정보
    @Override
    @Transactional
    public AppResumeDTO selectAppResumeByMember(int resume_no) {
        return appManageRepository.selectAppResumeByMember(resume_no);
    }

    //채용관리 지원자 상세 페이지: 2) 지원자 이력 정보 - 파일(사진,이력서)
    @Override
    @Transactional
    public AppResumeFileDTO selectAppResumeFileByMember(int resume_no){
        return appManageRepository.selectAppResumeFileByMember(resume_no);
    }

    //채용관리 지원자 상세 페이지: 1차 면접일자 등록
    @Override
    @Transactional
    public int updateAppManageFirstEnroll(AppManageDTO appManageDTO){
        return appManageRepository.updateAppManageFirstEnroll(appManageDTO);
    };

    //채용관리 지원자 상세 페이지: 1차 면접일자 반려
    @Override
    @Transactional
    public int updateAppManageFirstDenial(int status_no){
        return appManageRepository.updateAppManageFirstDenial(status_no);
    };

    //채용관리 지원자 상세 페이지: 최종 면접일자 승인
    @Override
    @Transactional
    public int updateAppManageLastEnroll(int status_no){
        return appManageRepository.updateAppManageLastEnroll(status_no);
    };

    //채용관리 지원자 상세 페이지: 최종 면접일자 반려
    @Override
    @Transactional
    public int updateAppManageLastDenial(int status_no){
        return appManageRepository.updateAppManageLastDenial(status_no);
    };

}
