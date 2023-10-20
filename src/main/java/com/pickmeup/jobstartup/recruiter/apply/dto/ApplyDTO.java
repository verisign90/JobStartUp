package com.pickmeup.jobstartup.recruiter.apply.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ApplyDTO {
    private int company_no;
    private int member_no;
    private String company_name;
    private String company_hp;
    private String ceo_name;
    private String company_type;
    private String business_type_code;
    private String company_address_code;
    private String company_sales;
    private String logo_orgname;
    private String logo_savname;
    private String company_address_detail;
    private String company_est;
    private String application_date;
    private String company_site;


    @Builder
    public ApplyDTO (ApplyDTO applyDTO){
        this.member_no = applyDTO.getMember_no();
        this.company_name = applyDTO.getCompany_name();
        this.company_hp = applyDTO.getCompany_hp();
        this.ceo_name = applyDTO.getCeo_name();
        this.company_type = applyDTO.getCompany_type();
        this.business_type_code = applyDTO.getBusiness_type_code();
        this.company_address_code = applyDTO.getCompany_address_code();
        this.company_sales = applyDTO.getCompany_sales();
        this.logo_orgname = applyDTO.getLogo_orgname();
        this.logo_savname = applyDTO.getLogo_savname();
    }

}
