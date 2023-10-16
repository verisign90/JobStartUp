package com.pickmeup.jobstartup.member.service;

import com.pickmeup.jobstartup.member.dto.JoinCommonDTO;
import com.pickmeup.jobstartup.member.dto.JoinCompanyDTO;
import com.pickmeup.jobstartup.member.entity.Member;

public interface MemberService {
    //아이디 중복 여부 검사
    boolean isDuplicateMemberId(String memberId);

    //일반회원가입
    Member join(JoinCommonDTO joinCommonDTO);

    //기업회원가입
    Member join(JoinCompanyDTO joinCompanyDTO);

    //회원 구분에 따른 메뉴ID 가져오기
    String getMemberMenuId(String memberType);

    //사용자에게 본인인증 문자 보내기
//    boolean sendSMS(String userPhoneNumber, String randomNumber);

    //이메일 중복 여부 검사
    boolean isDuplicateEmail(String emailInput);

    //회원 객체를 자동으로 로그인한 상태로 만듦
    void autoLogin(Member member);
}
