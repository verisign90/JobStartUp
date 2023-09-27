package com.pickmeup.jobstartup.controller;

import com.pickmeup.jobstartup.dto.TestDTO;
import com.pickmeup.jobstartup.service.TestService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@RequiredArgsConstructor
@Controller
public class TestController {

    @Autowired
    public TestService testService;



    @GetMapping("/test")
    public String selectTest(Model model) {

        System.out.println("진입");
        List<TestDTO> testData = testService.selectTest();
        System.out.println("test="+testData);
        model.addAttribute("testData",testData);

        return "test";

    }


}
