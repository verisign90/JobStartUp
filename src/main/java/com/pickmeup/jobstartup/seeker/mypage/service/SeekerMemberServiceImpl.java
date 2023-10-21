package com.pickmeup.jobstartup.seeker.mypage.service;

import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.seeker.mypage.repository.SeekerMemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SeekerMemberServiceImpl implements  SeekerMemberService{

    @Autowired
    private SeekerMemberRepository seekerMemberRepository;

    @Override
    public int updateMemberinfo (Member memberDTO) {
        return seekerMemberRepository.updateMemberinfo(memberDTO);
    }
}
