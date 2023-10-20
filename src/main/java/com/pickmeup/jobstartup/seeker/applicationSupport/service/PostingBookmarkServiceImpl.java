package com.pickmeup.jobstartup.seeker.applicationSupport.service;

import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.member.repository.MemberRepository;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.PostingBookmarkDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.repository.PostingBookmarkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostingBookmarkServiceImpl implements PostingBookmarkService {

    @Autowired
    private PostingBookmarkRepository postingBookmarkRepository;

    @Autowired
    private MemberRepository memberRepository;

    //공고 스크랩 리스트
    @Override
    public List<PostingBookmarkDTO> selectBookmarkList (int member_no) {
        return postingBookmarkRepository.selectBookmarkList(member_no);
    };


    //공고 스크랩
    @Override
    public int insertBookmark (PostingBookmarkDTO postingBookmarkDTO) {
        return postingBookmarkRepository.insertBookmark(postingBookmarkDTO);
    }

    //스크랩 삭제
    @Override
    public void deleteBookmark (PostingBookmarkDTO postingBookmarkDTO) {
        postingBookmarkRepository.deleteBookmark(postingBookmarkDTO);
    }

    //북마크 확인
    @Override
    public boolean checkBookmark (PostingBookmarkDTO postingBookmarkDTO) {
        return postingBookmarkRepository.checkBookmark(postingBookmarkDTO) > 0;
    }

    //Member객체를 받아오는 메서드
    @Override
    public Member findMemberByUsername (String username) {
        return memberRepository.findByUsername(username);
    }

    //북마크 cnt
    @Override
    public int bookmarkCnt (int member_no) {
        return postingBookmarkRepository.bookmarkCnt(member_no);
    }
}
