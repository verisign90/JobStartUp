package com.pickmeup.jobstartup.seeker.applicationSupport.service;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.PostingBookmarkDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.repository.PostingBookmarkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostingBookmarkServiceImpl implements PostingBookmarkService {

    @Autowired
    private PostingBookmarkRepository postingBookmarkRepository;

    //공고 스크랩 리스트
    @Override
    public List<PostingBookmarkDTO> selectBookmarkList (int member_no) {
        return postingBookmarkRepository.selectBookmarkList(member_no);
    };
}
