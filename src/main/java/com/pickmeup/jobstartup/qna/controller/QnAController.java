package com.pickmeup.jobstartup.qna.controller;

import com.pickmeup.jobstartup.qna.dto.QuestionDTO;
import com.pickmeup.jobstartup.qna.service.QnAService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequiredArgsConstructor
@RequestMapping("/qna")
public class QnAController {

    private final QnAService qnAService;

    @GetMapping("/write")
    public String writeForm(){
        return "/qna/questionWriteForm";
    }

    @PostMapping("/write")
    public String write(QuestionDTO questionDTO, @RequestParam("qFile_orgName") MultipartFile[] multipartFiles) throws Exception {
        questionDTO.setMember_no(13L);
        questionDTO.setCompany_no(0);
        qnAService.write(questionDTO, multipartFiles);
        return "/qna/writeDone";
    }

    @GetMapping("/list")
    public String list(){
        return "/qna/questionList";
    }
}