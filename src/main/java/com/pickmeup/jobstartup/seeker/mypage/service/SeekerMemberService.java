package com.pickmeup.jobstartup.seeker.mypage.service;


import com.pickmeup.jobstartup.member.entity.Member;

public interface SeekerMemberService {

    //일반 회원정보 수정
    int updateMemberinfo (Member memberDTO);
}
