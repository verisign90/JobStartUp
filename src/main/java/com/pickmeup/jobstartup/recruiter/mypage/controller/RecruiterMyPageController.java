package com.pickmeup.jobstartup.recruiter.mypage.controller;

import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import com.pickmeup.jobstartup.recruiter.apply.service.ApplyServiceImpl;
import com.pickmeup.jobstartup.recruiter.appmanagement.dto.AppManageDTO;
import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterCalendarDTO;
import com.pickmeup.jobstartup.recruiter.mypage.dto.RecruiterFileDTO;
import com.pickmeup.jobstartup.recruiter.mypage.service.RecruiterMyPageService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.*;

@RequestMapping("/recruiter")
@RequiredArgsConstructor
@Controller
public class RecruiterMyPageController {
    @Autowired
    private RecruiterMyPageService recruiterMyPageService;

    //관련 서비스 또는 DTO
    private ApplyServiceImpl applyService;
    private ApplyDTO applyDTO;

    //기업 페이지: 회사 정보
    @GetMapping("/myPage")
    public String companyInfo(@RequestParam int company_no, Model model) {
        //Business Logic
        AppManageDTO appManageDTO = recruiterMyPageService.selectRecruiterInfo(company_no);         //이건? 바꿔야 함
        RecruiterFileDTO recruiterFileDTO = recruiterMyPageService.selectComLogoName(company_no);   //file select
        //Model and View
        recruiterFileDTO.setCompany_no(company_no);
        model.addAttribute("appManageDTO", appManageDTO);
        model.addAttribute("recruiterFileDTO", recruiterFileDTO);
        return "/recruiter/mypage/recruiterMyPage";
    }

    //기업 페이지: 1) 박람회 현황(Ajax) + pagination
    @PostMapping("/recJobFairList")
    public String companyJobFairList() {
        //Parameter: company_no
        //Business Logic: call InfoList.
        //Model and View
        return "";
    }

    //기업 페이지: 2) 공고 관리(Ajax) + pagination
    @PostMapping("/recApprovalList")
    public String companyApprovalList() {
        //Parameter: company_no
        //Business Logic: call InfoList.
        //Model and View
        return "";
    }

    //기업 페이지: 3) 지원자 관리(Ajax) + pagination
    @PostMapping("/recManageAppList")
    public String companyManageAppList() {
        //Parameter: company_no
        //Business Logic: call InfoList.
        //Model and View
        return "";
    }

    //기업 페이지: 정보 수정 리스트 (또는 approval 담당의 jsp 이용)
    @PostMapping("/editCompanyInfoList")
    public String editCompanyInfoList() {

        return "";
    }

    //기업 페이지: 정보 수정 (또는 approval 담당의 jsp 이용)
    @PostMapping("/editCompanyInfo")
    public String editCompanyInfo() {

        return "";
    }

    //기업 페이지: pagination


    //기업 페이지: 파일 - 저장된 로고 출력
    @RequestMapping("/printComLogo")
    public String process(HttpServletResponse response, int company_no) throws Exception {

        RecruiterFileDTO recruiterFileDTO = recruiterMyPageService.selectComLogoName(company_no);
        String logo_savname = recruiterFileDTO.getLogo_savname();

        //File: 경로 설정
        String fileRepository = "C:\\jobStartUp_fileUpload";
        String path = fileRepository+"\\"+logo_savname;
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

    //기업 페이지: 파일 - 저장된 로고 이름 확인
    @PostMapping("/selectComLogo")
    public String selectComLogoName(@RequestParam int company_no) {

        //Business Logic
        RecruiterFileDTO recruiterFileDTO = new RecruiterFileDTO();
        recruiterFileDTO = recruiterMyPageService.selectComLogoName(company_no);
        //Model and View
        return recruiterFileDTO.getLogo_savname();
    }

    //기업 페이지: 파일 - 로고 수정(원본 삭제, 파일 업로드)
    @PostMapping("/updateComLogo")
    public String updateComLogo(Model model, @RequestParam int company_no,
                                @RequestParam("logoFile") MultipartFile logoFile) {

        //Business Logic
        String savedSavname = selectComLogoName(company_no);
        recruiterMyPageService.updateComLogo(logoFile, company_no, savedSavname);
        //Model and View
        return "/recruiter/mypage/recruiterMyPage";
    }

    //기업 페이지: 파일 - 로고 다운로드
    @RequestMapping("/downloadComLogo/{company_no}")
    public void download(RecruiterFileDTO recruiterFileDTO, @PathVariable int company_no, HttpServletResponse response) throws Exception{

        //Business Logic
        recruiterFileDTO = recruiterMyPageService.selectComLogoName(company_no);

        String logo_orgname = recruiterFileDTO.getLogo_orgname();
        String logo_savname = recruiterFileDTO.getLogo_savname();

        byte[] fileByte = FileUtils.readFileToByteArray(new File("C:\\jobStartUp_fileUpload\\"+logo_savname));
        response.setContentType("application/octet-stream");    //파일유형설정
        response.setContentLength(fileByte.length);             //파일길이설정
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(logo_orgname,"UTF-8")+"\";"); //데이터형식/성향설정 (attachment: 첨부파일)
        response.setHeader("Content-Transfer-Encoding", "binary");         //내용물 인코딩방식설정
        response.getOutputStream().write(fileByte);             //버퍼의 출력스트림을 출력
        response.getOutputStream().flush();                     //버퍼에 남아있는 출력스트림을 출력
        response.getOutputStream().close();                     //출력스트림을 닫는다
    }

    //기업 페이지: 캘린더 (임시 - 기업 페이지에 추가할 예정)
    @RequestMapping("/calendar")
    public String viewCalendar(){

        return "/recruiter/mypage/recruiterCalendar";
    }

    //기업 페이지: 캘린더 - 등록된 일정
    @GetMapping(value = "/getCalendar", params = "method=data", produces = "application/json")
    @ResponseBody // JSON 데이터를 반환
    public List<RecruiterCalendarDTO> selectPlan() {

        List<RecruiterCalendarDTO> calendarList = recruiterMyPageService.selectRecruCalendar();
        return calendarList; // 실제 데이터를 반환
    }

    //기업 페이지: 캘린더 팝업
    @PostMapping("/calendarPopup")
    public String companyCalendarPop(){






        return "/recruiter/mypage/recruiterCalendarPopUp";
    }


 /*   //기업 페이지: calendar 페이지
    @GetMapping("/getCalendar")
    public String companyCalendar(@RequestParam int company_no, Model mv){
        //Business Logic
        List<Map<String, Object>> recruiterCalendarDTOS = recruiterMyPageService.selectRecruCalendar(company_no);
        List<Map<String, Object>> result = new ArrayList<>();

        for (int i = 0; i < recruiterCalendarDTOS.size(); i++) {

            JSONObject jsonObject = new JSONObject();

            // recruiterCalendarDTO에서 원하는 필드 추출하여 JSON에 추가
            jsonObject.put("title", recruiterCalendarDTOS.get(i).get("SCHEDULE_TITLE"));
            jsonObject.put("start", recruiterCalendarDTOS.get(i).get("SCHEDULE_START").toString().substring(0,10));
            jsonObject.put("end", recruiterCalendarDTOS.get(i).get("SCHEDULE_END").toString().substring(0,10));
            //jsonObject.put("start", recruiterCalendarDTOS.get(i).get("SCHEDULE_START"));
            //jsonObject.put("end", recruiterCalendarDTOS.get(i).get("SCHEDULE_END"));
            //jsonObject.put("start", "\""+recruiterCalendarDTOS.get(i).get("SCHEDULE_START").toString().substring(0,10)+"\"");
            //jsonObject.put("end", "\""+recruiterCalendarDTOS.get(i).get("SCHEDULE_END").toString().substring(0,10)+"\"");

            // JSON을 Map으로 변환
            Map<String, Object> paramMap = jsonObject.toMap();

            // List에 Map 추가
            result.add(paramMap);
        }

        System.out.println("0"+result.get(0));
        System.out.println("1"+result.get(1));
        System.out.println("2"+result.get(2));

        mv.addAttribute("result",result);
        return "/recruiter/mypage/recruiterCalendar";
    }*/




}
