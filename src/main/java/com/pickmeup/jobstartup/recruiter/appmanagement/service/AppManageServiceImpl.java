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

/*
    //채용관리 지원자 상세 페이지: mailing service - 1차 메일링(면접일자 안내)
    @Override
    @Transactional
    public void sendMailFirstEnroll(String member_email){
        //text mail을 보낼 수 있도록 설정 - multipart라면 MimeMessage
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        //mail content
        simpleMailMessage.setSubject("면접일자 안내입니다");
        simpleMailMessage.setText("안녕하세요. OOOO 채용 담당자입니다. OOOO 모집에 관심을 갖고 지원해주셔서 진심으로 감사 드립니다.\n" +
                "\n" +
                "공채 서류전형 결과 보고 드립니다. OOOO 선발 서류전형 \"합격\"을 축하 드립니다.\n" +
                "\n" +
                "면접은 OOOO-OO-OO에 진행되며, 진행 방법은 이후 별도로 문자 안내 드리겠습니다.\n" +
                "면접에 불참하실 경우, 면접일자 전에 반드시 메일 회신을 부탁드립니다.\n" +
                "\n" +
                "감사합니다.");
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
        simpleMailMessage.setText("안녕하세요. OOOO 채용 담당자입니다. OOOO 모집에 관심을 갖고 지원해주셔서 진심으로 감사 드립니다.\n" +
                "\n" +
                "서류 전형 발표 후 다시 연락드리기 죄송한 마음도 있지만, 귀한 시간 내어 OOOO 에 지원해주신 분들께 감사 인사를 드리는 것이 예의일 것 같아 연락 드립니다.\n" +
                "\n" +
                "공채 서류전형 결과 보고 드립니다. 귀하의 뛰어난 역량과 잠재력에도 불구하고 안타깝게도 서류심사 과정에서 귀하의 합격 소식을 전해드리지 못하게 되었습니다. 어떠한 말로도 위로를 건낼 수 없으나 귀하가 보여주신 많은 열정과 노력에 대해 이렇게 짧은 글로나마 안타까운 심정을 전합니다. 감히 말씀 드리자면 귀하의 역량이 부족하다는 것은 결코 아니니 서류 발표로 너무 상심하지 않으셨으면 합니다.\n" +
                "\n" +
                "비록 이번에는 좋은 만남을 이어나갈 수 없게 되었지만, 이후 더욱 성장한 모습으로 다시금 만날 수 있기를 진심으로 바랍니다. 저희 OOOO도 더욱 성장하여 다음 기회에는 많은 분들을 모실 수 있도록 하겠습니다.\n");
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
        simpleMailMessage.setText("안녕하세요. OOOO 채용 담당자입니다. OOOO 모집에 관심을 갖고 지원해주셔서 진심으로 감사 드립니다.\n" +
                "\n" +
                "공채 최종 면접 전형 발표 결과 보고 드립니다. OOOO 최종 \"합격\"을 축하 드립니다.\n" +
                "\n" +
                "향후 입사에 관한 연락은 문자로 안내될 예정입니다. 또한 연락처로 연락을 드릴 예정입니다.\n" +
                "\n" +
                "감사합니다.");
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
        simpleMailMessage.setText("안녕하세요. OOOO 채용 담당자입니다. OOOO 모집에 관심을 갖고 지원해주셔서 진심으로 감사 드립니다.\n" +
                "\n" +
                "최종 면접 전형 발표 후 다시 연락드리기 죄송한 마음도 있지만, 귀한 시간 내어 OOOO 에 지원해주신 분들께 감사 인사를 드리는 것이 예의일 것 같아 연락 드립니다.\n" +
                "\n" +
                "공채 최종 면접 전형 결과 보고 드립니다. 귀하의 뛰어난 역량과 잠재력에도 불구하고 안타깝게도 귀하의 합격 소식을 전해드리지 못하게 되었습니다. 어떠한 말로도 위로를 건낼 수 없으나 귀하가 보여주신 많은 열정과 노력에 대해 이렇게 짧은 글로나마 안타까운 심정을 전합니다. 감히 말씀 드리자면 귀하의 역량이 부족하다는 것은 결코 아니니 너무 상심하지 않으셨으면 합니다.\n" +
                "\n" +
                "비록 이번에는 좋은 만남을 이어나갈 수 없게 되었지만, 이후 더욱 성장한 모습으로 다시금 만날 수 있기를 진심으로 바랍니다. 저희 OOOO도 더욱 성장하여 다음 기회에는 많은 분들을 모실 수 있도록 하겠습니다.\n");
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
*/

}
