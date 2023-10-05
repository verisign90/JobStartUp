package com.pickmeup.jobstartup.resume.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Data
public class LanguageCertificateDTO {

    private int lang_cer_no; //어학자격증 번호
    private int lang_no; //언어 글번호
    private String lang_cer_exam; //어학 자격증명
    private String lang_cer_grade; //어학 점수 및 등급
    private Timestamp lang_cer_date; //자격증 취득일자

    public LanguageCertificateDTO () {}

    /*@Builder
    public LanguageCertificateDTO (List<LanguageCertificateDTO> languageCertificateDTO) {

        List<LanguageCertificateDTO> languageCertificateDTOList = new ArrayList<>();

        for (LanguageCertificateDTO languageCertificate : languageCertificateDTO) {
            this.lang_cer_no = languageCertificate.getLang_cer_no();
            this.lang_no = languageCertificate.getLang_no();
            this.lang_cer_exam = languageCertificate.getLang_cer_exam();
            this.lang_cer_grade = languageCertificate.getLang_cer_grade();
            this.lang_cer_date = languageCertificate.getLang_cer_date();

            languageCertificateDTOList.add(languageCertificate);
        }
    }*/

    @Builder
    public LanguageCertificateDTO(int lang_cer_no, int lang_no, String lang_cer_exam, String lang_cer_grade, Timestamp lang_cer_date) {
        this.lang_cer_no = lang_cer_no;
        this.lang_no = lang_no;
        this.lang_cer_exam = lang_cer_exam;
        this.lang_cer_grade = lang_cer_grade;
        this.lang_cer_date = lang_cer_date;
    }
}
