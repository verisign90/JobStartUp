package com.pickmeup.jobstartup.seeker.resume.dto;

import lombok.Builder;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class ResumeDTO {

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

    public ResumeDTO () {}

    @Builder
    public ResumeDTO (ResumeDTO resumeDTO) {
        this.resume_no = resumeDTO.getResume_no();
        this.member_no = resumeDTO.getMember_no();
        this.resume_title = resumeDTO.getResume_title();
        this.profile_orgname = resumeDTO.getProfile_orgname();
        this.profile_savname = resumeDTO.getProfile_savname();
        this.resume_money = resumeDTO.getResume_money();
        this.resume_skill = resumeDTO.getResume_skill();
        this.resume_orgname = resumeDTO.getResume_orgname();
        this.resume_savname = resumeDTO.getResume_savname();
        this.resume_url = resumeDTO.getResume_url();
    }

}
