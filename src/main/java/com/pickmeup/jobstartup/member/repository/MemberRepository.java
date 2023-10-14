package com.pickmeup.jobstartup.member.repository;

import com.pickmeup.jobstartup.member.entity.Member;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberRepository {
    //아이디 중복 확인
    int countByMemberId(String memberId);

    //일반회원가입
    int savePerson(Member member);

    //기업회원가입
//    int saveCompany(Member member);

    //회원 구분에 따른 메뉴ID 가져오기
    String selectMenuId(String memberType);

    //이메일 중복 확인
    int countByEmail(String email);

    //스프링 시큐리티를 위한 것. 아이디로 멤버 가져오기
    Member findByUsername(String username);
}
