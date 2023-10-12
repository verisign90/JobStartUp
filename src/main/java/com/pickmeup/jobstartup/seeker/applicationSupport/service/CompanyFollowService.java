package com.pickmeup.jobstartup.seeker.applicationSupport.service;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.CompanyFollowDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CompanyFollowService {

    //관심기업 목록
    public List<CompanyFollowDTO> selectCompanyFollowList (int member_no);
}
