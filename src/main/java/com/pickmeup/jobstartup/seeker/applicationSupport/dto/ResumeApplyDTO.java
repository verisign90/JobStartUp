package com.pickmeup.jobstartup.seeker.applicationSupport.dto;

import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;
import com.pickmeup.jobstartup.seeker.resume.dto.*;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
public class ResumeApplyDTO {

    private JobPostingDTO jobPostingDTO;

    private int resume_no; //이력서 글번호
    private int member_no; //작성한 회원번호
    private String resume_title; //글제목
    private String profile_orgname; //프로필사진 원본명
    private String profile_savname; //프로필사진 저장명
    private int resume_money; //희망연봉
    private String resume_skill; //업무능력_skill
    private String resume_orgname; //이력서 첨부파일로 받을시 원본명
    private String resume_savname; //이력서 첨부파일로 받을시 저장명
    private String resume_url;//이력서 URL

    @Builder.Default
    private List<CareerDTO> careerDTOList = new ArrayList<>();

    @Builder.Default
    private List<ResumeLocDTO> resumeLocDTOList = new ArrayList<>();

    @Builder.Default
    private List<CertificateDTO> certificateDTOList = new ArrayList<>();

    @Builder.Default
    private List<LanguageDTO> languageDTOList = new ArrayList<>();

    @Builder.Default
    private List<LanguageCertificateDTO> languageCertificateDTOList = new ArrayList<>();

    @Builder
    public ResumeApplyDTO (ResumeApplyDTO resumeApplyDTO) {
        this.resume_no = resumeApplyDTO.getResume_no();
        this.member_no = resumeApplyDTO.getMember_no();
        this.resume_title = resumeApplyDTO.getResume_title();
        this.profile_orgname = resumeApplyDTO.getProfile_orgname();
        this.profile_savname = resumeApplyDTO.getProfile_savname();
        this.resume_money = resumeApplyDTO.getResume_money();
        this.resume_skill = resumeApplyDTO.getResume_skill();
        this.resume_orgname = resumeApplyDTO.getResume_orgname();
        this.resume_savname = resumeApplyDTO.getResume_savname();
        this.resume_url = resumeApplyDTO.getResume_url();
    }
}
