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
    boolean sendSMS(String userPhoneNumber, String randomNumber);

    //이메일 중복 여부 검사
    boolean isDuplicateEmail(String emailInput);

    //회원 객체를 자동으로 로그인한 상태로 만듦
    void autoLogin(Member member);

    //사업자등록번호 중복 확인
    boolean isDuplicateBusinessNo(String business_no);

    //개인회원 아이디 찾기
    String findPersonId(String name, String phone);

    //개인회원 비밀번호 찾기
    Member findPersonPassword(String memberId, String memberName, String memberPhone);

    //개인회원 비밀번호 재설정
    void updatePassword(String memberId, String newPassword);

    //기업회원 아이디 찾기
    String findCompanyId(String name, String business_no);

    //기업회원 비밀번호 찾기
    Member findCompanyPassword(String memberId, String memberName, String memberPhone);

    //기업회원 비밀번호 재설정
    void updateCompanyPassword(String memberId, String newPassword);

    //회원 id로 멤벅 객체 가져오기
    Member getMember(String memberId);

    //회원 번호로 멤버 객체 가져오기
    Member getMemberNo(long memberNo);

    //탈퇴하기
    void withdrawal(Long member_no);

    //username으로 member_no 찾기
    Long findMemberNoByUsername(String username);

}
