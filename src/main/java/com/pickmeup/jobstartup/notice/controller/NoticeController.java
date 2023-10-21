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

import java.util.Arrays;

@Controller
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeController {

    private final NoticeService noticeService;

    //게시글 등록 폼
    @GetMapping("/write")
    public String writeForm(){
        return "/notice/noticeWriteForm";
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
        return "/notice/noticeList02";
    }

    //상세 페이지
    @GetMapping("/read/{not_no}")
    public String readDetail(@PathVariable long not_no, Model model){
        NoticeDTO noticeDTO = noticeService.readDatail(not_no);
        model.addAttribute("noticeDTO", noticeDTO);
        return "/notice/noticeDetail";
    }

    //수정 폼 요청
    @GetMapping("/modify/{not_no}")
    public String modify(@PathVariable long not_no, Model model) throws Exception {
        NoticeDTO noticeDTO = noticeService.readDatail(not_no);

        ObjectMapper mapper = new ObjectMapper();
        String categoryJson = mapper.writeValueAsString(noticeDTO.getNot_category());
        String fileListJson = mapper.writeValueAsString(noticeDTO.getFileDTOList());
        model.addAttribute("noticeDTO", noticeDTO);
        model.addAttribute("categoryJson", categoryJson);
        model.addAttribute("fileListJson", fileListJson);
        return "/notice/noticeModifyForm";
    }

    @PostMapping("/modify")
    public String modify(NoticeDTO noticeDTO, @RequestParam("notFile_orgName") MultipartFile[] multipartFiles, @RequestParam(value = "preFileNo", required = false) long[] preFileNo) throws Exception {
        //기존의 사진을 모두 삭제했을 때
        if(preFileNo==null){
            noticeService.modify(noticeDTO, multipartFiles);
        } else {
            Arrays.sort(preFileNo);
            System.out.println(preFileNo.length);
            noticeService.modify(noticeDTO, multipartFiles, preFileNo);
        }
        return "redirect:/notice/list";
    }

    @GetMapping("/delete/{not_no}")
    public String delete(@PathVariable long not_no) throws Exception {
        noticeService.delete(not_no);
        return "redirect:/notice/list";
    }
}
