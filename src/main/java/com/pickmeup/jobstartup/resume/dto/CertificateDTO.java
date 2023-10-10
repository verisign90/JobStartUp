package com.pickmeup.jobstartup.resume.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
public class CertificateDTO {

    private int cer_no; //자격증 글번호
    private int resume_no; //이력서 글번호
    private String cer_name; //자격증명
    private String cer_issuer; //자격증 발급기관
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date cer_date; //자격증 발급날짜

    @Builder
    public CertificateDTO(int cer_no, int resume_no, String cer_name, String cer_issuer, Date cer_date) {
        this.cer_no = cer_no;
        this.resume_no = resume_no;
        this.cer_name = cer_name;
        this.cer_issuer = cer_issuer;
        this.cer_date = cer_date;
    }
}
