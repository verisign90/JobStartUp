package com.pickmeup.jobstartup.dto;

import com.pickmeup.jobstartup.entity.MemberType;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JoinCommonDTO {
    private String member_id;
    private MemberType member_type = MemberType.COMMON;
    private String member_name;
    private String member_pw;
    private String member_pw_confirm;
    @Pattern(regexp = "^(19|20)\\d{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$", message = "YYYYMMDD 입력 형식을 확인해 주세요")
    private String member_birth;
    @NotEmpty(message = "성별을 선택해 주세요")
    private String member_sex;
    @Pattern(regexp = "^\\d{3}\\d{3,4}\\d{4}$", message = "잘못된 휴대폰 번호입니다. 휴대폰 번호를 정확하게 입력해주세요.")
    private String member_hp;
    @Email(message = "올바른 이메일 형식이 아닙니다.")
    private String member_email;
    private String member_loc;
}
