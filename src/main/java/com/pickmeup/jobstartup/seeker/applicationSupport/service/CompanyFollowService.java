package com.pickmeup.jobstartup.seeker.applicationSupport.service;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.CompanyFollowDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CompanyFollowService {

    //관심기업 목록
    public List<CompanyFollowDTO> selectCompanyFollowList (int member_no);

    //기업 팔로우
    public int insertFollow (CompanyFollowDTO companyFollowDTO);

    //기업 언팔로우
    public void deleteFollow (CompanyFollowDTO companyFollowDTO);

    //checkFollow
    public boolean checkFollow (CompanyFollowDTO companyFollowDTO);
}
