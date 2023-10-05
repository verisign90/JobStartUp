package com.pickmeup.jobstartup.resume.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
public class LanguageDTO {

    private int lang_no; //언어 글번호
    private int resume_no; //FK.이력서 글번호
    private String lang_name; //언어명
    private String lang_level; //언어수준 일상회화 가능. 비즈니스 회화가능. 원어민 수준

    public LanguageDTO () {}

    /*@Builder
    public LanguageDTO (List<LanguageDTO> languageDTO) {
        List<LanguageDTO> languageDTOList = new ArrayList<>();

        for (LanguageDTO language : languageDTO) {
            this.lang_no = language.getLang_no();
            this.resume_no = language.getResume_no();
            this.lang_name = language.getLang_name();
            this.lang_level = language.getLang_level();

            languageDTOList.add(language);
        }
    }*/

    @Builder
    public LanguageDTO(int lang_no, int resume_no, String lang_name, String lang_level) {
        this.lang_no = lang_no;
        this.resume_no = resume_no;
        this.lang_name = lang_name;
        this.lang_level = lang_level;
    }
}
