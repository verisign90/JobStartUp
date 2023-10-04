package com.pickmeup.jobstartup.resume.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
public class CertificateDTO {

    private int cer_no; //자격증 글번호
    private int resume_no; //이력서 글번호
    private String cer_name; //자격증명
    private String cer_issuer; //자격증 발급기관
    private Timestamp cer_date; //자격증 발급날짜

    /*@Builder
    public CertificateDTO (List<CertificateDTO> certificateDTO) {

        List<CertificateDTO> certificateDTOList = new ArrayList<>();

        for (CertificateDTO certificate : certificateDTO) {
            this.cer_no = certificate.getCer_no();
            this.resume_no = certificate.getResume_no();
            this.cer_name = certificate.getCer_name();
            this.cer_issuer = certificate.getCer_issuer();
            this.cer_date = certificate.getCer_date();

            certificateDTOList.add(certificate);
        }
    }*/

    @Builder
    public CertificateDTO(int cer_no, int resume_no, String cer_name, String cer_issuer, Timestamp cer_date) {
        this.cer_no = cer_no;
        this.resume_no = resume_no;
        this.cer_name = cer_name;
        this.cer_issuer = cer_issuer;
        this.cer_date = cer_date;
    }
}
