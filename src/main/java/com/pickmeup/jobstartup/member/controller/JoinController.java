package com.pickmeup.jobstartup.member.controller;

import com.pickmeup.jobstartup.member.dto.JoinCommonDTO;
import com.pickmeup.jobstartup.member.service.MemberService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.service.DefaultMessageService;
import oracle.ucp.proxy.annotation.Post;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Controller
@RequiredArgsConstructor
public class JoinController {
    private final MemberService memberService;

    //회원가입 - 개인회원, 기업회원 버튼 보여주기
    @GetMapping("/join")
    public String join() {
        return "member/join";
    }

    //개인 회원가입
    @GetMapping("/joinCommon")
    public String joinCommon(Model model) {
        return "member/joinCommon";
    }

    @PostMapping("/joinCommon")
    public String joinCommon(@Valid @ModelAttribute JoinCommonDTO joinCommonDTO, BindingResult bindingResult, Model model) {
        //dto 유효성 검사
        if (bindingResult.hasErrors()) {
            model.addAttribute("errors", bindingResult.getFieldErrors());
            return "member/joinCommon";
        }

        //비밀번호 일치 검사
        if (!joinCommonDTO.getMember_pw().equals(joinCommonDTO.getMember_pw_confirm())) {
            model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
            return "member/joinCommon";
        }

        //성별 선택 검사
        if (joinCommonDTO.getMember_sex() == null || joinCommonDTO.getMember_sex().isEmpty()) {
            model.addAttribute("errorMessage", "성별을 선택해 주세요.");
            return "membr/joinCommon";
        }

        try {
            memberService.join(joinCommonDTO);
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "member/joinCommon";
        }
        return "redirect:/mainCommon";
    }

    //개인회원 아이디 중복 확인
    @PostMapping("/checkDuplicate")
    @ResponseBody
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
        return "member/mainCommon";
    }

    //4자리 인증번호 받기
//    @PostMapping("/phoneCheck")
//    @ResponseBody
//    public ResponseEntity<Map<String, String>> phoneCheck(HttpSession session,
//                                                          @RequestParam String userPhoneNumber) {
//        int randomNumber = new Random().nextInt(9000) + 1000;
//        memberService.sendSMS(userPhoneNumber, Integer.toString(randomNumber));
//
//        session.setAttribute("verifyCode", Integer.toString(randomNumber));
//        session.setAttribute("verifyCodeTime", System.currentTimeMillis());
//
//        Map<String, String> response = new HashMap<>();
//        return new ResponseEntity<>(response, HttpStatus.OK);
//    }
//
//    //문자로 받은 4자리 인증번호와 사용자가 입력한 4자리 인증번호가 일치하는지 확인
//    @PostMapping("/verifyCode")
//    @ResponseBody
//    public ResponseEntity<Map<String, Object>> verifyCode(HttpSession session,
//                                                          @RequestParam String userEnteredCode) {
//        Map<String, Object> response = new HashMap<>();
//
//        String verifyCode = (String) session.getAttribute("verifyCode");
//        Long verifyCodeTime = (Long) session.getAttribute("verifyCodeTime");
//
//        if(verifyCodeTime != null && System.currentTimeMillis() - verifyCodeTime <= 3 * 60 * 1000
//                && userEnteredCode.equals(verifyCode)) {
//            response.put("verified", true);
//        } else {
//            response.put("verified", false);
//        }
//        return new ResponseEntity<>(response, HttpStatus.OK);
//    }

    @PostMapping("/duplicateEmail")
    @ResponseBody
    public ResponseEntity<Map<String, Boolean>> checkDuplicateEmail(@RequestBody Map<String, String> request) {
        String member_email = request.get("member_email");
        boolean isDuplicate = memberService.isDuplicateEmail(member_email);

        Map<String, Boolean> response = new HashMap<>();
        response.put("isDuplicate", isDuplicate);

        return ResponseEntity.ok(response);
    }

}