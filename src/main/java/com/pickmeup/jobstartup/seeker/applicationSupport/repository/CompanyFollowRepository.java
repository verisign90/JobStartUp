package com.pickmeup.jobstartup.seeker.applicationSupport.repository;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.CompanyFollowDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CompanyFollowRepository {

    //관심기업 목록
    public List<CompanyFollowDTO> selectCompanyFollowList (int member_no);
}
