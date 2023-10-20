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

    //공고 스크랩
    public int insertBookmark (PostingBookmarkDTO postingBookmarkDTO);

    //스크랩 삭제
    public void deleteBookmark (PostingBookmarkDTO postingBookmarkDTO);

    //북마크 확인
    public int checkBookmark (PostingBookmarkDTO postingBookmarkDTO);

    //북마크 cnt
    int bookmarkCnt (int member_no);
}
