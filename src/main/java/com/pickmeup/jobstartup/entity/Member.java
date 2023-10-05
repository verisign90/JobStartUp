package com.pickmeup.jobstartup.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Member {
    private String member_id;
    private MemberType member_type = MemberType.COMMON;
    private String menu_id;
    private String member_name;
    private String member_pw;
    private String member_sex;
    private String member_hp;
    private String member_email;
    private String member_regdate;
    private String member_loc;
    private String member_birth;
    private String status_yn;
    private String business_no;
    private String is_show;
}
