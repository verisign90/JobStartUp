package com.pickmeup.jobstartup.admin.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pickmeup.jobstartup.admin.dto.AgeGroupDTO;
import com.pickmeup.jobstartup.admin.dto.NoticeDTO;
import com.pickmeup.jobstartup.admin.service.NoticeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class NoticeController {

    private final NoticeService noticeService;

    @GetMapping("/admin/noticeList")
    public String noticeList(Model model) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());

        try {
            List<NoticeDTO> notice = noticeService.getAllNotice();
            model.addAttribute("notice", notice);

            String noticeJson = mapper.writeValueAsString(noticeService.getAllNotice());
            model.addAttribute("noticeJson", noticeJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "admin/noticeList";
    }
}
