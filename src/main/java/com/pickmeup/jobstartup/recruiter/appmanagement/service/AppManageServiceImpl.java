package com.pickmeup.jobstartup.recruiter.appmanagement.service;

import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppManageDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppResumeDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppResumeFileDTO;
import com.pickmeup.jobstartup.recruiter.appmanagement.repository.AppManageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service("AppManageService")
@RequiredArgsConstructor
public class AppManageServiceImpl implements AppManageService{

    @Autowired
    private AppManageRepository appManageRepository;

    @Autowired
    private JavaMailSender javaMailSender;

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

    //채용관리 지원자 상세 페이지: mailing service - 1차 메일링(면접일자 안내)
    @Override
    @Transactional
    public void sendMailFirstEnroll(String member_email){
        //text mail을 보낼 수 있도록 설정 - multipart라면 MimeMessage
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        //mail content
        simpleMailMessage.setSubject("면접일자 안내입니다");
        simpleMailMessage.setText("test입니다 어떻게 전송될까요");
        simpleMailMessage.setFrom("test@test.com");
        simpleMailMessage.setTo(member_email);
        javaMailSender.send(simpleMailMessage);
    }

    //채용관리 지원자 상세 페이지: mailing service - 1차 메일링(불합격 안내)
    @Override
    @Transactional
    public void sendMailFirstDenial(String member_email){
        //text mail을 보낼 수 있도록 설정 - multipart라면 MimeMessage
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        //mail content
        simpleMailMessage.setSubject("채용이 거절되었습니다");
        simpleMailMessage.setText("안녕하세요 채용이 거절되었습니다");
        simpleMailMessage.setFrom("test@test.com");
        simpleMailMessage.setTo(member_email);
        javaMailSender.send(simpleMailMessage);
    }

    //채용관리 지원자 상세 페이지: mailing service - 최종 메일링(최종합격 안내)
    @Override
    @Transactional
    public void sendMailLastEnroll(String member_email) {
        //text mail을 보낼 수 있도록 설정 - multipart라면 MimeMessage
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        //mail content
        simpleMailMessage.setSubject("최종 합격입니다 축하합니다");
        simpleMailMessage.setText("test입니다 어떻게 전송될까요");
        simpleMailMessage.setFrom("test@test.com");
        simpleMailMessage.setTo(member_email);
        javaMailSender.send(simpleMailMessage);
    }

    //채용관리 지원자 상세 페이지: mailing service - 최종 메일링(불합격 안내)
    @Override
    @Transactional
    public void sendMailLastDenial(String member_email) {
        //text mail을 보낼 수 있도록 설정 - multipart라면 MimeMessage
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        //mail content
        simpleMailMessage.setSubject("최종 채용 거절입니다");
        simpleMailMessage.setText("test입니다 어떻게 전송될까요");
        simpleMailMessage.setFrom("test@test.com");
        simpleMailMessage.setTo(member_email);
        javaMailSender.send(simpleMailMessage);
    }

    //mailing setContent (common)
    protected SimpleMailMessage mailContent(String member_email){
        //text mail을 보낼 수 있도록 설정 - multipart라면 MimeMessage
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        //mail content
        simpleMailMessage.setSubject("최종 채용이 거절되었습니다");
        simpleMailMessage.setText("test입니다 어떻게 전송될까요");
        simpleMailMessage.setFrom("test@test.com");
        simpleMailMessage.setTo(member_email);
        return simpleMailMessage;
    }

}
