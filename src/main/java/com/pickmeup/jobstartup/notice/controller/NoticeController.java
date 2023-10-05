package com.pickmeup.jobstartup.notice.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.notice.dto.NoticeDTO;
import com.pickmeup.jobstartup.notice.service.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeController {

    private final NoticeService noticeService;

    //게시글 등록 폼
    @GetMapping("/write")
    public String writeForm(){
        return "/notice/writeForm";
    }

    //게시글 등록
    @PostMapping("/write")
    public String write(NoticeDTO noticeDTO, @RequestParam("notFile_orgName") MultipartFile[] multipartFiles) throws Exception {
        noticeService.write(noticeDTO, multipartFiles);
        return "redirect:/notice/list";
    }


    //게시글 list
    @GetMapping(value = {"/list", "/list/{category}"})
    public String getList(@PathVariable(required = false) String category, Criteria criteria, Model model) throws Exception {
        if(category == null) {
            category = "all";
        }
        System.out.println("category : "+category);
        criteria.setCategory(category);
        PagingResponse<NoticeDTO> noticePage = noticeService.getList(criteria);

        //to jason
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());
        String listJson = mapper.writeValueAsString(noticePage.getList());
        String noticePageJson = mapper.writeValueAsString(noticePage.getPagination());
        String criteriaJson = mapper.writeValueAsString(criteria);

        model.addAttribute("noticePage", noticePage);
        model.addAttribute("noticePageJson", noticePageJson);
        model.addAttribute("criteriaJson", criteriaJson);
        model.addAttribute("listJson", listJson);

        switch (category) {
            case "seeker" -> {
                return "/notice/list_seeker";
            } case "company" -> {
                return "/notice/list_company";
            }
            case "all" -> {
            }
        }
        return "/notice/list";
    }


}
