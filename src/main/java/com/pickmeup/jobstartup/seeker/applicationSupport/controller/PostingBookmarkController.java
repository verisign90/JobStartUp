package com.pickmeup.jobstartup.seeker.applicationSupport.controller;

import com.pickmeup.jobstartup.seeker.applicationSupport.dto.PostingBookmarkDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.PostingBookmarkServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/seeker")
public class PostingBookmarkController {

    private static final Logger logger = LoggerFactory.getLogger(PostingBookmarkController.class);

    @Autowired
    private PostingBookmarkServiceImpl postingBookmarkService;

    //공고 북마크목록
    @RequestMapping ("/bookmarkList/{member_no}")
    public String selectBookmarkList (@PathVariable int member_no, Model model) {
        List<PostingBookmarkDTO> bookmarkListResult = postingBookmarkService.selectBookmarkList(member_no);
        model.addAttribute("bookmarkListResult", bookmarkListResult);
        return "seeker/applicationSupport/bookmarkList";
    }
}
