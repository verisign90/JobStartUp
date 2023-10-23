package com.pickmeup.jobstartup.member.controller;

import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.member.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/member")
public class FindController {
    private final MemberService memberService;

    //아이디, 비밀번호 찾기 첫 페이지
    @GetMapping("/find")
    public String find() {
        return "member/find";
    }

    //개인회원 아이디 찾기
    @GetMapping("/findPersonId")
    public String findPersonId() {
        return "member/findPersonId";
    }

    @PostMapping("/findPersonId")
    @ResponseBody
    public ResponseEntity<Map<String, String>> findPersonId(@RequestParam("name") String name, @RequestParam("phone") String phone) {
        Map<String, String> response = new HashMap<>();
        String foundId = memberService.findPersonId(name, phone);

        if (foundId != null) {
            response.put("message", "당신의 아이디는 " + foundId + " 입니다");
        } else {
            response.put("message", "일치하는 아이디를 찾을 수 없습니다");
        }
        return ResponseEntity.ok(response);
    }

    //개인회원 아이디 조회 결과
//    @GetMapping("/resultPersonId")
//    public String resultPersonId() {
//        return "member/resultPersonId";
//    }



    //개인회원 비밀번호 재설정
    @GetMapping("/updatePassword")
    public String updatePassword() {
        return "member/updatePassword";
    }

    @PostMapping("/updatePassword")
    @ResponseBody
    public ResponseEntity<String> updatePassword(@RequestParam String newPassword,
                                                 @RequestParam String confirmPassword,
                                                 @RequestParam String memberId) {
        log.info("updatePassword 컨트롤러 진입: {}", memberId);
        if (newPassword.equals(confirmPassword)) {
            memberService.updatePassword(memberId, newPassword);
            log.info("비밀번호 두 입력창 비교: {}", memberId);
            return ResponseEntity.ok("비밀번호가 재설정되었습니다");
        } else {
            log.warn("비밀번호가 일치하지 않음: {}", memberId);
            return ResponseEntity.badRequest().body("입력된 비밀번호가 일치하지 않습니다");
        }
    }

    //기업회원 아이디 찾기
    @GetMapping("/findCompanyId")
    public String findCompanyId() {
        return "member/findCompanyId";
    }

    @PostMapping("/findCompanyId")
    @ResponseBody
    public ResponseEntity<Map<String, String>> findCompanyId(@RequestParam("name") String name,
                                                             @RequestParam("business_no") String business_no) {
        Map<String, String> response = new HashMap<>();
        String foundId = memberService.findCompanyId(name, business_no);

        if (foundId != null) {
            response.put("message", "당신의 아이디는 " + foundId + " 입니다");
        } else {
            response.put("message", "일치하는 아이디를 찾을 수 없습니다");
        }
        return  ResponseEntity.ok(response);
    }

    //기업회원 아이디 조회 결과
    @GetMapping("/resultCompanyId")
    public String resultCompanyId() {
        return "member/resultCompanyId";
    }

    //개인회원 비밀번호 찾기
    @GetMapping("/findPersonPassword")
    public String findPersonPassword(HttpSession session) {
        session.removeAttribute("message");
        return "member/findPersonPassword";
    }

    @PostMapping("/findPersonPassword")
    public ResponseEntity<Map<String, Object>> findPersonPassword(@RequestParam("memberId") String memberId,
                                                                  @RequestParam("memberName") String memberName,
                                                                  @RequestParam("memberPhone") String memberPhone) {
        Map<String, Object> response = new HashMap<>();
        Member member = memberService.findPersonPassword(memberId, memberName, memberPhone);
        if (member != null) {
            response.put("status", "success");
            response.put("message", "회원 정보를 찾았습니다");
            return ResponseEntity.ok(response);
        } else {
            response.put("status", "error");
            response.put("message", "일치하는 회원 정보를 찾을 수 없습니다");
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }

    //기업회원 비밀번호 찾기
    @GetMapping("/findCompanyPassword")
    public String findCompanyPassword(HttpSession session) {
        session.removeAttribute("message");
        return "member/findCompanyPassword";
    }

    @PostMapping("/findCompanyPassword")
    public ResponseEntity<Map<String, Object>> findCompanyPassword(@RequestParam("memberId") String memberId,
                                                                   @RequestParam("memberName") String memberName,
                                                                   @RequestParam("memberPhone") String memberPhone) {
        Map<String, Object> response = new HashMap<>();
        Member member = memberService.findCompanyPassword(memberId, memberName, memberPhone);

        if (member != null) {
            response.put("status", "success");
            response.put("message", "회원 정보를 찾았습니다");
            return ResponseEntity.ok(response);
        } else {
            response.put("status", "error");
            response.put("message", "일치하는 회원 정보를 찾을 수 없습니다");
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(response);
        }
    }

    //기업회원 비밀번호 재설정
    @GetMapping("/updateCompanyPassword")
    public String updateCompanyPassword() {
        return "member/updateCompanyPassword()";
    }

    @PostMapping("/updateCompanyPassword")
    @ResponseBody
    public ResponseEntity<String> updateCompanyPassword(@RequestParam String newPassword,
                                                        @RequestParam String confirmPassword,
                                                        @RequestParam String memberId) {
        if (newPassword.equals(confirmPassword)) {
            memberService.updateCompanyPassword(memberId, newPassword);
            return ResponseEntity.ok("비밀번호가 재설정되었습니다");
        } else {
            return ResponseEntity.badRequest().body("입력된 비밀번호가 일치하지 않습니다");
        }
    }
}
