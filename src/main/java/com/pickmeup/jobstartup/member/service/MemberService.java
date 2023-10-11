package com.pickmeup.jobstartup.member.service;

import com.pickmeup.jobstartup.member.dto.JoinCommonDTO;

public interface MemberService {
    //아이디 중복 여부 검사
    boolean isDuplicateMemberId(String memberId);

    //회원가입
    void join(JoinCommonDTO joinCommonDTO);

    //회원 구분에 따른 메뉴ID 가져오기
    String getMemberMenuId(String memberType);

    //사용자에게 본인인증 문자 보내기
//    boolean sendSMS(String userPhoneNumber, String randomNumber);

    //이메일 중복 여부 검사
    boolean isDuplicateEmail(String emailInput);
}
