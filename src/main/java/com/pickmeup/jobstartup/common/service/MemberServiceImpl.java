package com.pickmeup.jobstartup.common.service;

import com.pickmeup.jobstartup.common.dto.JoinCommonDTO;
import com.pickmeup.jobstartup.common.entity.Member;
import com.pickmeup.jobstartup.common.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    private final MemberRepository memberRepository;
    private final ModelMapper modelMapper;

    //개인회원 아이디 중복 여부 검사
    @Override
    public boolean isDuplicateMemberId(String memberId) {
        int count = memberRepository.countByMemberId(memberId);
        return count > 0;
    }

    //회원가입
    @Override
    public void join(JoinCommonDTO joinCommonDTO) {
        Member member = convertDtoToEntity(joinCommonDTO);
        String menuId = getMemberMenuId(joinCommonDTO.getMember_type().getCode());
        member.setMenu_id(menuId);
        memberRepository.save(member);
    }

    @Override
    public String getMemberMenuId(String memberType) {
        return memberRepository.selectMenuId(memberType);
    }

    //joinCommonDTO를 Member엔티티로 바꾸기
    private Member convertDtoToEntity(JoinCommonDTO joinCommonDTO) {
        Member member = modelMapper.map(joinCommonDTO, Member.class);
        return member;
    }
}
