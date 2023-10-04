package com.pickmeup.jobstartup.resume.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class ResumeParameter {
    private ResumeDTO resumeDTO;
    private List<ResumeLocDTO> resumeLocDTO;
    private List<CareerDTO> careerDTO;
    private List<CertificateDTO> certificateDTO;
    private List<LanguageDTO> languageDTO;
    private List<LanguageCertificateDTO> languageCertificateDTO;

    @Builder
    public ResumeParameter(ResumeDTO resumeDTO, List<ResumeLocDTO> resumeLocDTO, List<CareerDTO> careerDTO, List<CertificateDTO> certificateDTO, List<LanguageDTO> languageDTO, List<LanguageCertificateDTO> languageCertificateDTO) {
        this.resumeDTO = resumeDTO;
        this.resumeLocDTO = resumeLocDTO;
        this.careerDTO = careerDTO;
        this.certificateDTO = certificateDTO;
        this.languageDTO = languageDTO;
        this.languageCertificateDTO = languageCertificateDTO;
    }
}

