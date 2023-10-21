package com.pickmeup.jobstartup.message.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.message.dto.MessageDTO;
import com.pickmeup.jobstartup.message.service.MessageService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/message")
public class MessageController {

    private final MessageService messageService;

    @GetMapping("/list02")
    public String messageList02(){
        return "/message/messageList";
    }

    @PostMapping("/write")
    @ResponseBody
    public String sendMessage(@ModelAttribute("messageDTO") MessageDTO messageDTO) throws Exception {
        messageService.sendMessage(messageDTO);
        return "success";
    }

    @GetMapping("/list")
    public String messageList(HttpSession session, Criteria criteria, Model model) throws Exception {
        Integer intNo = (Integer) session.getAttribute("memberNo");
        if(intNo==null) {
            return "redirect:/login";
        }
        Long member_no = intNo.longValue();
        PagingResponse<MessageDTO> messageDTOPage = messageService.getMessageList(member_no, criteria);
        model.addAttribute("messageDTOPage", messageDTOPage);
        return "/message/messageList02";
    }

    @GetMapping("/sentList")
    public String messageSentList(HttpSession session, Criteria criteria, Model model) throws Exception {
        Integer intNo = (Integer) session.getAttribute("memberNo");
        if(intNo==null) {
            return "redirect:/login";
        }
        Long member_no = intNo.longValue();
        PagingResponse<MessageDTO> messageDTOPage = messageService.messageSentList(member_no, criteria);
        model.addAttribute("messageDTOPage", messageDTOPage);
        return "/message/messageSentList";
    }

    @PostMapping("/read")
    public ResponseEntity<String> readMessage(Model model, @RequestBody Map<String, Object> requestData) throws Exception {
        long mes_no = Long.parseLong(requestData.get("mes_no").toString());
        MessageDTO messageDTO = messageService.readMessage(mes_no);
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());
        String messageJson= mapper.writeValueAsString(messageDTO);
        return ResponseEntity.ok().body(messageJson);
    }

    @PostMapping("/sentRead")
    public ResponseEntity<String> readSentMessage(Model model, @RequestBody Map<String, Object> requestData) throws Exception {
        long mes_no = Long.parseLong(requestData.get("mes_no").toString());
        MessageDTO messageDTO = messageService.readSentMessage(mes_no);
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());
        String messageJson= mapper.writeValueAsString(messageDTO);
        return ResponseEntity.ok().body(messageJson);
    }

    @PostMapping("/receiver/delete")
    @ResponseBody
    public String deleteMessage(HttpSession session, @RequestBody List<String> selectedValues, Model model) throws Exception {
        Integer intNo = (Integer) session.getAttribute("memberNo");
        if(intNo==null) {
            return "redirect:/login";
        }
        Long mesReceiver = intNo.longValue();
        messageService.deleteMessage(mesReceiver, selectedValues);
        return "success";
    }

    @PostMapping("/sender/delete")
    @ResponseBody
    public String deleteSentMessage(HttpSession session, @RequestBody List<String> selectedValues, Model model) throws Exception {
        Integer intNo = (Integer) session.getAttribute("memberNo");
        if(intNo==null) {
            return "redirect:/login";
        }
        Long mesSender = intNo.longValue();
        messageService.deleteSentMessage(mesSender, selectedValues);
        return "success";
    }
}
