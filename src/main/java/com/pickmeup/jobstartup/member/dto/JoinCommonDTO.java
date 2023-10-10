package com.pickmeup.jobstartup.member.dto;

import com.pickmeup.jobstartup.member.entity.MemberType;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JoinCommonDTO {
    @Pattern(regexp="^[a-zA-Z0-9_]+$", message="아이디는 알파벳, 숫자, '_'로 이루어져야 합니다.")
    @NotEmpty(message="아이디를 입력하세요.")
    @Size(min=4, max=20, message="아이디는 4~20자의 영문, 숫자, '_'로 이루어져야 합니다")
    private String member_id;

    private MemberType member_type = MemberType.COMMON;

    @NotEmpty(message = "이름은 필수 입력 사항입니다.")
    @Pattern(regexp = "^[가-힣a-zA-Z]*$", message = "이름에는 특수문자와 숫자를 사용할 수 없습니다.")
    private String member_name;

    @Pattern(regexp="^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{4,8}$|(?=.*[A-Za-z])(?=.*[\\W_])[A-Za-z\\W_]{4,8}$|(?=.*\\d)(?=.*[\\W_])[\\d\\W_]{4,8}$", message="4~8자리 영문 대소문자, 숫자, 특수문자 중 2가지 조합으로 만들어 주세요.")
    private String member_pw;
    private String member_pw_confirm;

    @Pattern(regexp = "^\\d{8}$", message = "생년월일은 8자리 숫자로 입력해주세요.")
    private String member_birth;

    @NotEmpty(message = "성별을 선택해 주세요")
    private String member_sex;
    @Pattern(regexp = "^\\d{3}\\d{3,4}\\d{4}$", message = "잘못된 휴대폰 번호입니다. 휴대폰 번호를 정확하게 입력해주세요.")
    private String member_hp;
    @Email(message = "올바른 이메일 형식이 아닙니다.")
    private String member_email;
    private String member_loc;
}
