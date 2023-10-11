package com.pickmeup.jobstartup.member.repository;

import com.pickmeup.jobstartup.member.entity.Member;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberRepository {
    //아이디 중복 확인
    int countByMemberId(String memberId);
    //회원가입
    int save(Member member);
    //회원 구분에 따른 메뉴ID 가져오기
    String selectMenuId(String memberType);
    //이메일 중복 확인
    int countByEmail(String email);
}
