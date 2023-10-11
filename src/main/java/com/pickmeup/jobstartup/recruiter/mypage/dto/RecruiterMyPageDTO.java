package com.pickmeup.jobstartup.recruiter.mypage.dto;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
public class RecruiterMyPageDTO {

    private int company_no;
    private int member_no;
    private String company_name;
    private String company_hp;
    private String ceo_name;
    private String company_type;
    private String business_type_code;
    private String company_address_detail;
    private String company_site;
    private String listing_status;
    private String company_est;
    private String company_sales;

}
