package com.pickmeup.jobstartup.controller;

import com.pickmeup.jobstartup.dto.SampleDTO;
import com.pickmeup.jobstartup.service.SampleService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class SampleController {

    @Autowired
    public SampleService sampleService;

    @GetMapping("/sample")
    public String selectSample(Model model) {

        System.out.println("진입");
        List<SampleDTO> sampleDTOs = sampleService.selectSample();
        System.out.println("sample: " + sampleDTOs);
        model.addAttribute("sampleDTOs", sampleDTOs);

        return "sample";
    }
}
