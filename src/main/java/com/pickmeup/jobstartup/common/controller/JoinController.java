package com.pickmeup.jobstartup.common.controller;

import com.pickmeup.jobstartup.common.dto.JoinCommonDTO;
import com.pickmeup.jobstartup.common.service.MemberService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class JoinController {
    private final MemberService memberService;

    //회원가입 - 개인회원, 기업회원 버튼 보여주기
    @GetMapping("/join")
    public String join() {
        return "join";
    }

    //개인 회원가입
    @GetMapping("/joinCommon")
    public String joinCommon(Model model) {
        return "joinCommon";
    }

    @PostMapping("/joinCommon")
    public String joinCommon(@Valid @ModelAttribute JoinCommonDTO joinCommonDTO, BindingResult bindingResult, Model model) {
        //dto 유효성 검사
        if (bindingResult.hasErrors()) {
            model.addAttribute("errors", bindingResult.getFieldErrors());
            return "joinCommon";
        }

        //비밀번호 일치 검사
        if (!joinCommonDTO.getMember_pw().equals(joinCommonDTO.getMember_pw_confirm())) {
            model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
            return "joinCommon";
        }

        //성별 선택 검사
        if (joinCommonDTO.getMember_sex() == null || joinCommonDTO.getMember_sex().isEmpty()) {
            model.addAttribute("errorMessage", "성별을 선택해 주세요.");
            return "joinCommon";
        }

        memberService.join(joinCommonDTO);
        return "redirect:/mainCommon";
    }

    //개인회원 아이디 중복 확인
    @PostMapping("/checkDuplicate")
    public ResponseEntity<Map<String, Boolean>> checkDuplicate(@RequestBody Map<String, String> request) {
        String member_id = request.get("member_id");
        boolean isDuplicate = memberService.isDuplicateMemberId(member_id);

        Map<String, Boolean> response = new HashMap<>();
        response.put("isDuplicate", isDuplicate);

        return ResponseEntity.ok(response);
    }

    //개인회원 가입 성공시 보여지는 페이지
    @GetMapping("/mainCommon")
    public String mainCommon() {
        return "mainCommon";
    }

}
