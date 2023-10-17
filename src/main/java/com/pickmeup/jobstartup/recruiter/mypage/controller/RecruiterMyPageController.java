package com.pickmeup.jobstartup.recruiter.mypage.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pickmeup.jobstartup.common.paging.Criteria;
import com.pickmeup.jobstartup.common.paging.PagingResponse;
import com.pickmeup.jobstartup.notice.dto.NoticeDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import com.pickmeup.jobstartup.recruiter.apply.service.ApplyService;
import com.pickmeup.jobstartup.recruiter.mypage.dto.*;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@RequestMapping("/recruiter")
@RequiredArgsConstructor
@Controller
public class RecruiterMyPageController {
    @Autowired
    private RecruiterMyPageService recruiterMyPageService;

    //관련 서비스 또는 DTO
    private ApplyService applyService;
    private ApplyDTO applyDTO;

    //기업 페이지: 회사 정보
    @GetMapping("/myPage")
    public String companyInfo(@RequestParam int company_no, Model model) {
        //Business Logic
        //Model and View
        RecruiterMyPageDTO recruiterMyPageDTO = recruiterMyPageService.selectRecruiterInfo(company_no);         //이건? 바꿔야 함
        RecruiterFileDTO recruiterFileDTO = recruiterMyPageService.selectComLogoName(company_no);   //file select
        recruiterFileDTO.setCompany_no(company_no);
        RecruiterCriteria criteria = new RecruiterCriteria();
        criteria.setCompany_no(company_no);
        int totalCount = recruiterMyPageService.getJobFairCount(criteria);
        RecruiterPageDTO recruiterPageDTO = new RecruiterPageDTO(criteria,totalCount);

        model.addAttribute("recruiterMyPageDTO", recruiterMyPageDTO);
        model.addAttribute("recruiterFileDTO", recruiterFileDTO);
        model.addAttribute("jobPostingList",recruiterMyPageService.getJobPostingList(criteria));
        model.addAttribute("jobPostingPaging",recruiterPageDTO);

        return "/recruiter/mypage/recruiterMyPage";
    }

    //기업 페이지: 채용 공고 관리(Ajax) + pagination
    @PostMapping("/getJobFairList")
    public String companyJobFairList(@RequestParam int company_no, Model model) {
        RecruiterCriteria criteria = new RecruiterCriteria();
        criteria.setCompany_no(company_no);
        int totalCount = recruiterMyPageService.getJobPostingCount(criteria);
        RecruiterPageDTO recruiterPageDTO = new RecruiterPageDTO(criteria,totalCount);
        model.addAttribute("jobPostingList",recruiterMyPageService.getJobPostingList(criteria));
        model.addAttribute("jobPostingPaging",recruiterPageDTO);
        return "/recruiter/mypage/recruiterMyPage";
    }

    //기업 페이지: 박람회 현황(Ajax) + pagination
    @PostMapping("/getJobPostingList")
    public String getJobPostingLists(@RequestParam int company_no, Model model) {
        RecruiterCriteria criteria = new RecruiterCriteria();
        criteria.setCompany_no(company_no);
        int totalCount = recruiterMyPageService.getJobFairCount(criteria);
        RecruiterPageDTO recruiterPageDTO = new RecruiterPageDTO(criteria,totalCount);
        model.addAttribute("jobPostingList",recruiterMyPageService.getJobFairList(criteria));
        model.addAttribute("jobPostingPaging",recruiterPageDTO);
        return "/recruiter/mypage/recruiterMyPage";
    }




    //기업 페이지: 3) 지원자 관리(Ajax) + pagination
    @PostMapping("/getAppList")
    public String companyAppList() {
        //Parameter: company_no
        //Business Logic: call AppList
        //Model and View
        return "";
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

        byte[] fileByte = FileUtils.readFileToByteArray(new File("C:/jobStartUp_fileUpload/company/logo/"+logo_savname));
        response.setContentType("application/octet-stream");    //파일유형설정
        response.setContentLength(fileByte.length);             //파일길이설정
        response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(logo_orgname,"UTF-8")+"\";"); //데이터형식/성향설정 (attachment: 첨부파일)
        response.setHeader("Content-Transfer-Encoding", "binary");         //내용물 인코딩방식설정
        response.getOutputStream().write(fileByte);             //버퍼의 출력스트림을 출력
        response.getOutputStream().flush();                     //버퍼에 남아있는 출력스트림을 출력
        response.getOutputStream().close();                     //출력스트림을 닫는다
    }

    //기업 페이지: 조회 - 캘린더 일정
    @GetMapping(value = "/getCalendar", params = "method=data", produces = "application/json")
    @ResponseBody
    public List<RecruiterCalendarDTO> selectCalendar() {
        List<RecruiterCalendarDTO> calendarList = recruiterMyPageService.selectRecruCalendar();
        return calendarList; // 실제 데이터를 반환
    }

    //기업 페이지: 입력 - 캘린더 일정
    @ResponseBody
    @PostMapping(value = "/insertCalendar", produces = "application/json")
    public String insertCalendar(@RequestBody RecruiterCalendarDTO recruiterCalendarDTO
                                ,@RequestParam String method){
        recruiterMyPageService.insertRecruCalendar(recruiterCalendarDTO);
        return "success";
    }

    //기업 페이지: 삭제 - 캘린더 일정
    @ResponseBody
    @PostMapping(value = "/deleteCalendar", produces = "application/json")
    public String deleteCalendar(@RequestBody RecruiterCalendarDTO recruiterCalendarDTO
                                ,@RequestParam String method){
        recruiterMyPageService.deleteRecruCalendar(recruiterCalendarDTO);
        return "success";
    }

}
