package com.pickmeup.jobstartup.member.controller;

import com.pickmeup.jobstartup.member.service.AgeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AgeController {

    @Autowired
    private AgeService ageService;

    @GetMapping("/calculateAge")
    public String getAge(@RequestParam String birthdate, Model model) {
        int age = ageService.calculateAge(birthdate);
        model.addAttribute("age", age);

        return "ageResult";
    }
}
