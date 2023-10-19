package com.pickmeup.jobstartup.member.controller;

import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.member.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@Slf4j
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
    public String findPersonId(@RequestParam("name") String name, @RequestParam("phone") String phone, Model model) {
        String foundId = memberService.findPersonId(name, phone);

        if (foundId != null) {
            model.addAttribute("message", "아이디 조회 결과: " + foundId);
        } else {
            model.addAttribute("message", "일치하는 아이디를 찾을 수 없습니다");
        }
        return "member/resultPersonId";
    }

    //개인회원 아이디 조회 결과
    @GetMapping("/resultPersonId")
    public String resultPersonId() {
        return "member/resultPersonId";
    }

    //개인회원 비밀번호 찾기
    @GetMapping("/findPersonPassword")
    public String findPersonPassword() {
        return "member/findPersonPassword";
    }

    @PostMapping("/findPersonPassword")
    public String findPersonPassword(@RequestParam("memberId") String memberId,
                                     @RequestParam("memberName") String memberName,
                                     @RequestParam("memberPhone") String memberPhone, Model model,
                                     RedirectAttributes redirectAttrs) {
        Member member = memberService.findPersonPassword(memberId, memberName, memberPhone);
        if (member != null) {
            model.addAttribute("member", member);
            return "member/updatePassword";
        } else {
            redirectAttrs.addFlashAttribute("message", "일치하는 회원 정보를 찾을 수 없습니다");
            return "redirect:/findPersonPassword";
        }
    }

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
    public String findCompanyId(@RequestParam("name") String name,
                                @RequestParam("business_no") String business_no, Model model) {
        String foundId = memberService.findCompanyId(name, business_no);

        if (foundId != null) {
            model.addAttribute("message", "아이디 조회 결과: " + foundId);
        } else {
            model.addAttribute("message", "일치하는 아이디를 찾을 수 없습니다");
        }
        return "member/resultCompanyId";
    }

    //기업회원 아이디 조회 결과
    @GetMapping("/resultCompanyId")
    public String resultCompanyId() {
        return "member/resultCompanyId";
    }

    //기업회원 비밀번호 찾기
    @GetMapping("/findCompanyPassword")
    public String findCompanyPassword() {
        return "member/findCompanyPassword";
    }

    @PostMapping("/findCompanyPassword")
    public String findCompanyPassword(@RequestParam("memberId") String memberId, @RequestParam("memberName") String memberName,
                                      @RequestParam("memberPhone") String memberPhone, Model model,
                                      RedirectAttributes redirectAttrs) {
        Member member = memberService.findCompanyPassword(memberId, memberName, memberPhone);
        if (member != null) {
            model.addAttribute("member", member);
            return "member/updateCompanyPassword";
        } else {
            redirectAttrs.addFlashAttribute("message", "일치하는 회원 정보를 찾을 수 없습니다");
            return "redirect:/findCompanyPassword";
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
