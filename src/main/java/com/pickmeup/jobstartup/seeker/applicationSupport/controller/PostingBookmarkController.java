package com.pickmeup.jobstartup.seeker.applicationSupport.controller;

import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.member.service.UserSecurityService;
import com.pickmeup.jobstartup.recruiter.jobposting.dto.JobPostingDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.dto.PostingBookmarkDTO;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.CompanyFollowServiceImpl;
import com.pickmeup.jobstartup.seeker.applicationSupport.service.PostingBookmarkServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/seeker")
public class PostingBookmarkController {

    private static final Logger logger = LoggerFactory.getLogger(PostingBookmarkController.class);

    @Autowired
    private PostingBookmarkServiceImpl postingBookmarkService;

    @Autowired
    private CompanyFollowServiceImpl companyFollowService;

    //공고 북마크목록
    @RequestMapping ("/bookmarkList")
    public String selectBookmarkList (Model model) {

        int memberNo = 0;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            Object principal = authentication.getPrincipal();
            if (principal instanceof UserDetails) {
                Member member = postingBookmarkService.findMemberByUsername(((UserDetails) principal).getUsername());
                memberNo = member.getMember_no();
            }
        }

        List<PostingBookmarkDTO> bookmarkListResult = postingBookmarkService.selectBookmarkList(memberNo);
        int bookmartCnt = postingBookmarkService.bookmarkCnt(memberNo);
        int followCnt = companyFollowService.followCnt(memberNo);

        model.addAttribute("bookmarkListResult", bookmarkListResult);
        model.addAttribute("bookmarkCnt", bookmartCnt);
        model.addAttribute("followCnt", followCnt);

        return "seeker/applicationSupport/bookmarkList";
    }

    //공고 디테일 페이지 열리는 순간 북마크 되어있는지 확인하는 메서드
    @GetMapping("/checkBookmark")
    @ResponseBody
    public ResponseEntity<Boolean> checkBookmark(@ModelAttribute PostingBookmarkDTO postingBookmarkDTO, Principal principal) {
        logger.info("checkBookmark()-진입");
        Member member = postingBookmarkService.findMemberByUsername(principal.getName());
        postingBookmarkDTO.setMember_no(member.getMember_no());

        boolean isBookmarked = postingBookmarkService.checkBookmark(postingBookmarkDTO);

        return new ResponseEntity<>(isBookmarked, HttpStatus.OK);
    }

    //북마크 등록/해제
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/postBookmark")
    @ResponseBody
    public ResponseEntity<String> bookmarkJobPosting(@RequestParam boolean isBookmarked,
                                                     @RequestParam int posting_no,
                                                     @RequestParam int member_no) {
        PostingBookmarkDTO bookmark = null;
        // 북마크 추가 로직
        bookmark = PostingBookmarkDTO.builder()
                .posting_no(posting_no)
                .member_no(member_no)
                .build();
        if (!isBookmarked) {

            logger.info("bookmark:{}", bookmark);

            postingBookmarkService.insertBookmark(bookmark);

            // DB에 값 insert
            return ResponseEntity.ok("inserted");
        } else {
            // 북마크 삭제 로직
            postingBookmarkService.deleteBookmark(bookmark);

            // DB에서 값 delete
            return ResponseEntity.ok("deleted");
        }

    }

}
