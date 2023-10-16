package com.pickmeup.jobstartup.member.controller;

import com.pickmeup.jobstartup.member.dto.JoinCommonDTO;
import com.pickmeup.jobstartup.member.dto.JoinCompanyDTO;
import com.pickmeup.jobstartup.member.entity.Member;
//import com.pickmeup.jobstartup.member.service.BusinessNumberService;
import com.pickmeup.jobstartup.member.service.MemberService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
public class JoinController {
    private final MemberService memberService;
//    private final BusinessNumberService businessNumberService;

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

    //기업 회원가입
    @GetMapping("/joinCompany") 
    public String joinCompany(Model model){
        return "member/joinCompany";
    }

    //개인 회원가입
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
            return "member/joinCommon";
        }

        try {
            Member member = memberService.join(joinCommonDTO);
            memberService.autoLogin(member);
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            log.info("권한: " + authentication.getAuthorities());
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "member/joinCommon";
        }
        return "redirect:/";
    }

    //기업 회원가입
    @PostMapping("/joinCompany")
    public String joinCompany(@Valid @ModelAttribute JoinCompanyDTO joinCompanyDTO, BindingResult bindingResult, Model model) {
        //dto 유효성 검사
        if (bindingResult.hasErrors()) {
            model.addAttribute("errors", bindingResult.getFieldErrors());
            return "member/joinCompany";
        }

        //비밀번호 일치 검사
        if (!joinCompanyDTO.getMember_pw().equals(joinCompanyDTO.getMember_pw_confirm())) {
            model.addAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
            return "member/joinCompany";
        }

        //성별 선택 검사
        if (joinCompanyDTO.getMember_sex() == null || joinCompanyDTO.getMember_sex().isEmpty()) {
            model.addAttribute("errorMessage", "성별을 선택해 주세요.");
            return "member/joinCompany";
        }

        try {
            Member member = memberService.join(joinCompanyDTO);
            memberService.autoLogin(member);
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            log.info("권한: " + authentication.getAuthorities());
        } catch (IllegalArgumentException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "member/joinCompany";
        }
        return "redirect:/apply/apply";
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

    @GetMapping("/mainCompany")
    public String mainCompany() {
        return "member/mainCompany";
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

    //이메일 중복 검사
    @PostMapping("/duplicateEmail")
    @ResponseBody
    public ResponseEntity<Map<String, Boolean>> checkDuplicateEmail(@RequestBody Map<String, String> request) {
        String member_email = request.get("member_email");
        boolean isDuplicate = memberService.isDuplicateEmail(member_email);

        Map<String, Boolean> response = new HashMap<>();
        response.put("isDuplicate", isDuplicate);

        return ResponseEntity.ok(response);
    }

    @PostMapping("/verifyBusinessNumber")
    @ResponseBody
    public ResponseEntity<String> verifyBusinessNumber(@RequestBody String businessNumber) {
//        boolean isValid = businessNumberService.verifyBusinessNumber(businessNumber);

//        if(isValid) {
            return ResponseEntity.ok("사업자번호가 유효합니다.");
//        } else {
//            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("등록되지 않은 사업자번호입니다.");
//        }
    }
}