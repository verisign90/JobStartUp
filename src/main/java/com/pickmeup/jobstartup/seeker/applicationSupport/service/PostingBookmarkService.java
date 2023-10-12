package com.pickmeup.jobstartup.seeker.applicationSupport.service;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.PostingBookmarkDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface PostingBookmarkService {

    //공고 스크랩 리스트
    public List<PostingBookmarkDTO> selectBookmarkList (int member_no);
}
