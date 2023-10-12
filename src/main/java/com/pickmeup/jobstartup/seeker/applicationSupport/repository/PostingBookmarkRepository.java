package com.pickmeup.jobstartup.seeker.applicationSupport.repository;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.PostingBookmarkDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface PostingBookmarkRepository {

    //공고 스크랩 리스트
    public List<PostingBookmarkDTO> selectBookmarkList (int member_no);
}
