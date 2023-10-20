package com.pickmeup.jobstartup.seeker.applicationSupport.service;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.CompanyFollowDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.repository.CompanyFollowRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyFollowServiceImpl implements CompanyFollowService {

    @Autowired
    private CompanyFollowRepository companyFollowRepository;

    //관심기업 목록
    @Override
    public List<CompanyFollowDTO> selectCompanyFollowList (int member_no) {
        return companyFollowRepository.selectCompanyFollowList(member_no);
    }

    //기업 팔로우
    @Override
    public int insertFollow (CompanyFollowDTO companyFollowDTO) {
        return companyFollowRepository.insertFollow(companyFollowDTO);
    }

    //기업 언팔로우
    @Override
    public void deleteFollow (CompanyFollowDTO companyFollowDTO) {
        companyFollowRepository.deleteFollow(companyFollowDTO);
    }

    //checkFollow
    @Override
    public boolean checkFollow (CompanyFollowDTO companyFollowDTO) {
        return companyFollowRepository.checkFollow(companyFollowDTO) > 0;
    }

    //팔로우 cnt
    @Override
    public int followCnt (int member_no) {
        return companyFollowRepository.followCnt(member_no);
    }
}
