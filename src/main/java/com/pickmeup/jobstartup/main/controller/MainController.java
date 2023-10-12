package com.pickmeup.jobstartup.main.controller;

import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.main.service.MainServiceImpl;
import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import com.pickmeup.jobstartup.recruiter.apply.service.ApplyServiceImpl;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MainController {
    @Autowired
    public MainServiceImpl mainService;
    @GetMapping("/main")
    public String mainPage(Model model){

        List<ApplyDTO> applyDTOList = mainService.getCompanyList();
        List<JobFairDTO> jobFairDTO = mainService.getJobFairList();
        System.out.println("MainController에서 applyDTO 내용"+applyDTOList);
        model.addAttribute("applyDTOList", applyDTOList);
        model.addAttribute("jobFairDTO",jobFairDTO);
        //model.addAttribute("uploadPath", "C:/JobStartUp_file/");

        return "main/main";
    }

    @RequestMapping("/printComLogo")
    public String process(HttpServletResponse response, int company_no) throws Exception {

        ApplyDTO applyDTO = mainService.getCompanyNO(company_no);
        String logo_savname = applyDTO.getLogo_savname();

        //File: 경로 설정
        //String fileRepository = "C:\\jobStartUp_fileUpload";
        //String path = fileRepository+"\\"+logo_savname;
        String path = logo_savname;
        File file = new File(path);

        response.setHeader("Cache-Control", "no-cache");
        response.addHeader("Content-disposition", "attachment;file=" + logo_savname);

        FileInputStream in = new FileInputStream(file);
        OutputStream out = response.getOutputStream();

        byte[] buffer = new byte[1024*8];
        while(true) {
            int cnt = in.read(buffer);
            if(cnt==-1) break;
            out.write(buffer,0,cnt);
        }

        in.close();
        out.close();

        return null;
    }


}
