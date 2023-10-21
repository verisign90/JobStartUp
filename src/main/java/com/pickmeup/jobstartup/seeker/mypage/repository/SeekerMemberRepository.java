package com.pickmeup.jobstartup.seeker.mypage.repository;

import com.pickmeup.jobstartup.member.entity.Member;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface SeekerMemberRepository {

    //일반 회원정보 수정
    int updateMemberinfo (Member memberDTO);
}
