package com.pickmeup.jobstartup.seeker.resume.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
public class LanguageCertificateDTO {

    private int lang_cer_no; //어학자격증 번호
    private int lang_no; //언어 글번호
    private String lang_cer_exam; //어학 자격증명
    private String lang_cer_grade; //어학 점수 및 등급
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date lang_cer_date; //자격증 취득일자

    @Builder
    public LanguageCertificateDTO(int lang_cer_no, int lang_no, String lang_cer_exam, String lang_cer_grade, Date lang_cer_date) {
        this.lang_cer_no = lang_cer_no;
        this.lang_no = lang_no;
        this.lang_cer_exam = lang_cer_exam;
        this.lang_cer_grade = lang_cer_grade;
        this.lang_cer_date = lang_cer_date;
    }
}
