package com.pickmeup.jobstartup.member.repository;

import com.pickmeup.jobstartup.member.dto.CompanyDTO;
import com.pickmeup.jobstartup.member.entity.Member;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface MemberRepository {
    //아이디 중복 확인
    int countByMemberId(String memberId);

    //일반회원가입
    int savePerson(Member member);

    //기업회원가입
    int saveCompany(Member member);

    //회원 구분에 따른 메뉴ID 가져오기
    String selectMenuId(String memberType);

    //이메일 중복 확인
    int countByEmail(String email);

    //스프링 시큐리티를 위한 것. 아이디로 멤버 가져오기
    Member findByUsername(String username);

    //사업자등록번호 중복 확인
    Member findByBusinessNo(String business_no);

    CompanyDTO findCompanyNoByMemberNo(int memberNo);

    //개인회원 아이디 찾기
    String findPersonId(@Param("name") String name, @Param("phone") String phone);

    //개인회원 비밀번호 찾기
    Member findPersonPassword(@Param("memberId") String memberId, @Param("memberName") String memberName, @Param("memberPhone") String memberPhone);

    //비밀번호 재설정
    void updatePassword(@Param("memberId") String memberId, @Param("newPassword") String newPassword);

    //기업회원 아이디 찾기
    String findCompanyId(@Param("name") String name, @Param("business_no") String business_no);

    //기업회원 비밀번호 찾기
    Member findCompanyPassword(@Param("memberId") String memberId, @Param("memberName") String memberName, @Param("memberPhone") String memberPhone);

    //기업회원 비밀번호 재설정
    void updateCompanyPassword(@Param("memberId") String memberId, @Param("newPassword") String newPassword);
    
    //id로 멤버 객체 가져오기
    Member selectMemberById (String memberId);
    
    //no로 멤버 객체 가져오기
    Member selectMemberByNo(long memberNo);
}
