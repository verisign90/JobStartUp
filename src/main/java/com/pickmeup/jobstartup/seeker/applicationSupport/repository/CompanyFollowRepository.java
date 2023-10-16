package com.pickmeup.jobstartup.seeker.applicationSupport.repository;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.CompanyFollowDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.PostingBookmarkDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface CompanyFollowRepository {

    //관심기업 목록
    public List<CompanyFollowDTO> selectCompanyFollowList (int member_no);

    //기업 팔로우
    public int insertFollow (CompanyFollowDTO companyFollowDTO);

    //기업 언팔로우
    public void deleteFollow (CompanyFollowDTO companyFollowDTO);

    //checkFollow
    public int checkFollow (CompanyFollowDTO companyFollowDTO);
}
