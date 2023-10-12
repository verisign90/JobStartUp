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
}
