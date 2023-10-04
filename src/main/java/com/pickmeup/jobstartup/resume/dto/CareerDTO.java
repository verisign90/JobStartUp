package com.pickmeup.jobstartup.resume.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@NoArgsConstructor
public class CareerDTO {

    private int career_no; //경력 글번호
    private int resume_no; //FK.이력서 글번호
    private String career_date; //경력기간
    private String career_company; //회사
    private String business_type; //FK.경력직종
    private String career_work; //담당업무 및 성과

    @Builder
    public CareerDTO(int career_no, int resume_no, String career_date, String career_company, String business_type, String career_work) {
        this.career_no = career_no;
        this.resume_no = resume_no;
        this.career_date = career_date;
        this.career_company = career_company;
        this.business_type = business_type;
        this.career_work = career_work;
    }


}
