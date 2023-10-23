package com.pickmeup.jobstartup.recruiter.mypage.controller;

import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.FileDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.JobDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
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
import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;

@RequestMapping("/recruiter")
@RequiredArgsConstructor
@Controller
public class RecruiterMyPageController {

    //(주의!!!!!!!!!!!) Session 정보는 로그인 된 이후에 적용 예정, 중간중간 예외처리 및 유효성 검사 넣기
    //(주의!!!!!!!!!!!) 공통 코드 >> 하나의 메서드로 묶기
    //(주의!!!!!!!!!!!) 로직 구현은  >>> Service 영역으로 옮기기

    @Autowired
    private RecruiterMyPageService recruiterMyPageService;

    //관련 서비스 또는 DTO
    @Autowired
    private ApplyService applyService;
    private ApplyDTO applyDTO;

    //기업 페이지: 회사 정보
    @GetMapping("/myPage")
    public String companyInfo(@ModelAttribute("company_no") int company_no, Model model) {
        RecruiterMyPageDTO recruiterMyPageDTO = recruiterMyPageService.selectRecruiterInfo(company_no);
        RecruiterFileDTO recruiterFileDTO = recruiterMyPageService.selectComLogoName(company_no);
        recruiterFileDTO.setCompany_no(company_no);

        model.addAttribute("recruiterMyPageDTO", recruiterMyPageDTO);
        model.addAttribute("recruiterFileDTO", recruiterFileDTO);

        return "/recruiter/mypage/recruiterMyPage";
    }

    //기업 페이지: 파일 - 저장된 로고 이름 확인
    @PostMapping("/myPage/selectComLogo")
    public String selectComLogoName(@RequestParam int company_no) {
        RecruiterFileDTO recruiterFileDTO  = recruiterMyPageService.selectComLogoName(company_no);
        return recruiterFileDTO.getLogo_savname();
    }

    //기업 페이지: 파일 - 로고 수정(원본 삭제, 파일 업로드)
    @PostMapping("/myPage/updateComLogo")
    public String updateComLogo(Model model, @ModelAttribute("company_no") int company_no,
                                @RequestParam("logoFile") MultipartFile logoFile) {
        String savedSavname = selectComLogoName(company_no);
        recruiterMyPageService.updateComLogo(logoFile, company_no, savedSavname);
        return "/recruiter/mypage/recruiterMyPage";
    }

    //기업 페이지: 파일 - 로고 다운로드
    @RequestMapping("/myPage/downloadComLogo/{company_no}")
    public void download(RecruiterFileDTO recruiterFileDTO, @PathVariable int company_no, HttpServletResponse response) throws Exception{
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
    @ResponseBody
    @PostMapping(value = "/myPage/getCalendar", params = "method=data", produces = "application/json")
    public List<RecruiterCalendarDTO> selectCalendar(@RequestBody RecruiterCalendarDTO recruiterCalendarDTO
                                                    ,@RequestParam String method) {
        List<RecruiterCalendarDTO> calendarList = recruiterMyPageService.selectRecruCalendar(recruiterCalendarDTO.getCompany_no());
        return calendarList;
    }

    //기업 페이지: 입력 - 캘린더 일정
    @ResponseBody
    @PostMapping(value = "/myPage/insertCalendar", produces = "application/json")
    public String insertCalendar(@RequestBody RecruiterCalendarDTO recruiterCalendarDTO
                                ,@RequestParam String method){
        recruiterMyPageService.insertRecruCalendar(recruiterCalendarDTO);
        return "success";
    }

    //기업 페이지: 삭제 - 캘린더 일정
    @ResponseBody
    @PostMapping(value = "/myPage/deleteCalendar", produces = "application/json")
    public String deleteCalendar(@RequestBody RecruiterCalendarDTO recruiterCalendarDTO
                                ,@RequestParam String method){
        recruiterMyPageService.deleteRecruCalendar(recruiterCalendarDTO);
        return "success";
    }

    //채용 공고 관리
    @GetMapping("/myPage/jobPosting")
    public String getJobPosting(@ModelAttribute("company_no") int company_no, Model model) {
        RecruiterCriteria criteria = new RecruiterCriteria();
        criteria.setCompany_no(company_no);
        model.addAttribute("jobPostingList",recruiterMyPageService.getJobPostingList(criteria));
        return "/recruiter/mypage/recruiterMyPageContentList";
    }

    //채용 공고 관리 + pagination
    @GetMapping("/myPage/jobPostingWithPaging")
    public String getJobPostingWithPaging(@ModelAttribute("company_no") int company_no, Model model,
                                          RecruiterCriteria criteria) {
        criteria.setCompany_no(company_no);
        int totalCount = recruiterMyPageService.getJobPostingCount(criteria);
        model.addAttribute("jobPostingList",recruiterMyPageService.getJobPostingList(criteria));
        model.addAttribute("jobPostingPaging",new RecruiterPagingDTO(criteria,totalCount));
        return "/recruiter/mypage/recruiterMyList";
    }

    //기업 페이지: 박람회 현황
    @GetMapping("/myPage/jobFair")
    public String getJobFair(@ModelAttribute("company_no") int company_no, Model model) {
        RecruiterCriteria criteria = new RecruiterCriteria();
        criteria.setCompany_no(company_no);
        model.addAttribute("jobFairList",recruiterMyPageService.getJobFairList(criteria));
        return "/recruiter/mypage/recruiterMyPageContentList";
    }

    //기업 페이지: 박람회 현황 + pagination
    @GetMapping("/myPage/jobFairWithPaging")
    public String getJobFairWithPaging(@ModelAttribute("company_no") int company_no, Model model,
                                       RecruiterCriteria criteria) {
        criteria.setCompany_no(company_no);
        int totalCount = recruiterMyPageService.getJobFairCount(criteria);
        model.addAttribute("jobFairList",recruiterMyPageService.getJobFairList(criteria));
        model.addAttribute("jobFairPaging", new RecruiterPagingDTO(criteria,totalCount));
        return "/recruiter/mypage/recruiterMyList";
    }

    //기업 페이지: 지원자 관리
    @GetMapping("/myPage/appManage")
    public String companyAppList(@ModelAttribute("company_no") int company_no, Model model) {
        RecruiterCriteria criteria = new RecruiterCriteria();
        criteria.setCompany_no(company_no);
        model.addAttribute("appList",recruiterMyPageService.getAppList(criteria));
        return "/recruiter/mypage/recruiterMyPageContentList";
    }

    //기업 페이지: 지원자 관리 + pagination
    @GetMapping("/myPage/appManageWithPaging")
    public String companyAppListWithPaging(@ModelAttribute("company_no") int company_no, Model model,
                                           RecruiterCriteria criteria) {
        criteria.setCompany_no(company_no);
        int totalCount = recruiterMyPageService.getJobFairCount(criteria);
        model.addAttribute("appList",recruiterMyPageService.getAppList(criteria));
        model.addAttribute("appListPaging",new RecruiterPagingDTO(criteria,totalCount));
        return "/recruiter/mypage/recruiterMyList";
    }
    
    //기업 페이지: 일반 정보 수정폼
    @GetMapping("/myPage/generalInfo/{company_no}")
    public String getGeneralInfo(@ModelAttribute("company_no") int company_no,
                                 Model model) {

        RecruiterGeneralInfoDTO generalInfo = recruiterMyPageService.getGeneralInfo(company_no);
        model.addAttribute("generalInfo",generalInfo);
        return "/recruiter/mypage/recruiterMyPageMInfoEdit";
    }
    


    /* apply code */

    //기업 페이지: 정보 수정 (요청)
    @GetMapping("/myPage/editCompanyInfo/{company_no}")
    public String updateCompanyInfoForm(@ModelAttribute("company_no") int company_no,
                                        Model model) {

        List<FileDTO> fileDTOList = applyService.getFileList(company_no);
        ApplyDTO applyDTO = applyService.getCompanyInfo(company_no);
        List<LocDTO> upperLoc = applyService.getUpperLoc();
        List<JobDTO> upperJob = applyService.getBusiness_type_code_up();

        model.addAttribute("fileDTOList",fileDTOList);
        model.addAttribute("applyDTO",applyDTO);
        model.addAttribute("upperLoc", upperLoc);
        model.addAttribute("upperJob", upperJob);
        model.addAttribute("upperLoc", upperLoc);
        model.addAttribute("upperJob", upperJob);
        return "/recruiter/mypage/recruiterMyPageInfoEdit";
    }

    //기업 페이지: 정보 수정
    @PostMapping("/myPage/editCompanyInfo/{company_no}")
    public String updateCompanyInfo(@ModelAttribute("company_no") int company_no,
                                    @ModelAttribute("applyDTO") ApplyDTO applyDTO,
                                    @RequestParam("document") MultipartFile[] files,
                                    @RequestParam("logo") MultipartFile logoFile){
        if (!logoFile.isEmpty()) {
            try {
                String originalFileName = logoFile.getOriginalFilename();
                String uploadDir = "C:/jobStartUp_fileUpload/company/logo";
                UUID uuid = UUID.randomUUID();
                String logo_savname = uuid.toString()+"_"+originalFileName;
                String filePath = uploadDir + File.separator + logo_savname;
                File dest = new File(filePath);
                logoFile.transferTo(dest);
                applyDTO.setLogo_orgname(originalFileName);
                applyDTO.setLogo_savname(logo_savname);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        List<FileDTO> fileDTOList = new ArrayList<>();
        for (MultipartFile file : files) {
            int check = applyService.existCheck(file.getOriginalFilename(),company_no);
            if (!file.isEmpty() && check ==0) {
                try {
                    String originalFileName = file.getOriginalFilename();
                    String uploadDir = "C:/jobStartUp_fileUpload/company/file";
                    UUID uuid = UUID.randomUUID();
                    String cfile_savname = uuid.toString()+"_"+originalFileName;
                    String filePath = uploadDir + File.separator + cfile_savname;
                    File dest = new File(filePath);
                    file.transferTo(dest);
                    FileDTO fileDTO = new FileDTO();
                    fileDTO.setCfile_orgname(originalFileName);
                    fileDTO.setCfile_savname(cfile_savname);
                    fileDTOList.add(fileDTO);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        applyService.updateInfo(applyDTO);
        for (FileDTO fileDTO : fileDTOList) {
            System.out.println("test FileDTO" + fileDTO);
            fileDTO.setCompany_no(company_no);
        }
        applyService.insertFile(fileDTOList);

        return "redirect:/recruiter/myPage?company_no="+company_no;
    }

}
