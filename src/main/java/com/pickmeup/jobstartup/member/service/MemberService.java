package com.pickmeup.jobstartup.member.service;

import com.pickmeup.jobstartup.member.dto.JoinCommonDTO;

public interface MemberService {
    //개인회원 아이디 중복 여부 검사
    boolean isDuplicateMemberId(String memberId);

    //회원가입
    void join(JoinCommonDTO joinCommonDTO);

    //회원 구분에 따른 메뉴ID 가져오기
    String getMemberMenuId(String memberType);

    boolean sendSMS(String userPhoneNumber, String randomNumber);
}
