package com.pickmeup.jobstartup.seeker.applicationSupport.service;

import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.PostingBookmarkDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PostingBookmarkService {

    //공고 스크랩 리스트
    public List<PostingBookmarkDTO> selectBookmarkList (int member_no);

    //공고 스크랩
    public int insertBookmark (PostingBookmarkDTO postingBookmarkDTO);

    //스크랩 삭제
    public void deleteBookmark (PostingBookmarkDTO postingBookmarkDTO);

    //북마크 확인
    public boolean checkBookmark (PostingBookmarkDTO postingBookmarkDTO);

    //member_no를 받아오는 메서드
    public Member findMemberByUsername (String username);
}
