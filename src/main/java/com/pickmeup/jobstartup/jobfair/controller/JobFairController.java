package com.pickmeup.jobstartup.jobfair.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pickmeup.jobstartup.jobfair.dto.EntryDTO;
import com.pickmeup.jobstartup.jobfair.dto.JobFairDTO;
import com.pickmeup.jobstartup.jobfair.service.JobFairService;
import com.pickmeup.jobstartup.member.entity.Member;
import com.pickmeup.jobstartup.recruiter.apply.dto.ApplyDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.FileDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.JobDTO;
import com.pickmeup.jobstartup.recruiter.apply.dto.LocDTO;
import com.pickmeup.jobstartup.recruiter.apply.repository.ApplyRepository;
import com.pickmeup.jobstartup.recruiter.apply.service.ApplyService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import static com.pickmeup.jobstartup.member.entity.MemberType.COMPANY;
import static com.pickmeup.jobstartup.member.entity.MemberType.UNAPPROVED_COMPANY;

@Controller
@RequiredArgsConstructor
@RequestMapping("/jobfair")
public class JobFairController {

    private final JobFairService jobFairService;
    private final ApplyService applyService;//탁 service
    @GetMapping("/list")
    public String jobFairList(@RequestParam(value = "page", defaultValue = "1") int page,
                              @RequestParam(value = "size", defaultValue = "10") int size, Model model) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());

        try {
            Map<String, Object> paginationResult = jobFairService.getAllJobFair(page, size);
            List<JobFairDTO> jobFair = (List<JobFairDTO>) paginationResult.get("jobFairList");
            int totalPages = (int) paginationResult.get("totalPages");

            model.addAttribute("jobFair", jobFair);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("currentPage", page);

            String jobFairJson = mapper.writeValueAsString(jobFairService.getAllJobFair());
            model.addAttribute("jobFairJson", jobFairJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "jobfair/jobfair_list";
    }

    //Call JobFairDetail
    @GetMapping("/detail/{jobfair_no}")
    public String jobFairDetail(Model model, @PathVariable("jobfair_no") Long jobFairNo) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());

        try {
            JobFairDTO jobFair = jobFairService.getJobFairByNo(jobFairNo);
            model.addAttribute("jobFair", jobFair);

            String jobFairJson = mapper.writeValueAsString(jobFair);
            model.addAttribute("jobFairJson", jobFairJson);

            List<EntryDTO> entryDTOList = jobFairService.getEntryDTOListByNo(jobFairNo);
            model.addAttribute("entryCompany", entryDTOList);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "jobfair/jobfair_detail";
    }

    @GetMapping("/write")
    public String writeJobFair(Model model) {
        return "jobfair/jobfair_write";
    }

    @PostMapping("/write/save")
    public String write(@ModelAttribute JobFairDTO jobFairDTO) {
        jobFairService.writeJobFair(jobFairDTO);

        return "redirect:/admin/jobfairlist";
    }

    @GetMapping("/write/edit")
    public String editJobFair(@RequestParam("jobFairNo") Long jobFairNo, Model model) {
        JobFairDTO jobFair = jobFairService.getJobFairByNo(jobFairNo);
        model.addAttribute("jobFair", jobFair);

        return "jobfair/jobfair_edit";
    }

    @PostMapping("/write/update")
    public String updateJobFair(@ModelAttribute JobFairDTO jobFairDTO) {
        jobFairService.updateJobFair(jobFairDTO);

        return "redirect:/admin/jobfairdetail/" + jobFairDTO.getJOBFAIR_NO();
    }

    @GetMapping("/delete")
    public String deleteJobFair(@RequestParam("jobFairNo") Long jobFairNo) {
        jobFairService.delteJobFair(jobFairNo);

        return "redirect:/admin/jobfairlist";
    }

    @GetMapping("/companylist")
    public String jobFairCompanyList(Model model) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());


        try {
            List<EntryDTO> companies = jobFairService.getAllCompany();
            model.addAttribute("company", companies);

            String companyJson = mapper.writeValueAsString(jobFairService.getAllCompany());
            model.addAttribute("companyJson", companyJson);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "jobfair/jobfair_company_list";
    }

   /* @GetMapping("/entry/form") //수훈꺼 탁이 주석함
    public String jobFairForm(@RequestParam(name = "jobFairNo") Long jobFairNo, HttpServletRequest request, Model model) {
        Long memberNo = null;
        Object memberNoObj = request.getSession().getAttribute("memberNo");
        if (memberNoObj != null) {
            String memberNoStr = memberNoObj.toString();
            if (memberNoStr.matches("\\d+")) {
                memberNo = Long.valueOf(memberNoStr);
            }
        }

        Long companyNo = null;
        Object companyNoObj = request.getSession().getAttribute("companyNo");
        if (companyNoObj != null) {
            String companyNoStr = companyNoObj.toString();
            if (companyNoStr.matches("\\d+")) {
                companyNo = Long.valueOf(companyNoStr);
            }
        }

        if (companyNo != null) {
            ApplyDTO companyInfo = jobFairService.findCompanyByMemberNo(memberNo);
            model.addAttribute("companyInfo", companyInfo);

        }

        List<LocDTO> upperLoc = applyService.getUpperLoc();//탁 
        List<JobDTO> upperJob = applyService.getBusiness_type_code_up();//탁
        model.addAttribute("upperLoc", upperLoc);//탁
        model.addAttribute("upperJob", upperJob);//탁

        return "jobfair/approvalRequest";
    }*/

    /*@PostMapping("/entry") //수훈
    public String entryCompany(@ModelAttribute ApplyDTO companyDTO) {
        jobFairService.insertJobFairEntry(companyDTO);

        return "jobfair/jobfair_listist";
    }*/

    @GetMapping("/getLowerLoc2")//탁에게서 가져온 하위지역
    @ResponseBody
    public List<LocDTO> getLowerLoc(@RequestParam String upperLoc) {
        System.out.println(applyService.getLowerLoc(upperLoc));
        return applyService.getLowerLoc(upperLoc);
    }

    @GetMapping("/getBusiness_type_code_up")//탁에게서 가져온 하위업종
    @ResponseBody
    public List<JobDTO> getBusiness_type_code(@RequestParam String business_type_code_up) {
        // System.out.println(applyService.getLowerLoc(business_type_code_up));
        return applyService.getBusiness_type_code(business_type_code_up);
    }

    @GetMapping("/entry/form")//탁
    public String jobFairForm(@RequestParam(name = "jobFairNo") Long jobFairNo, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String memberId = authentication.getName();//접속자 아이디 가져오기
        System.out.println("나의 아이디= " + memberId );//접속자 아이디 확인
        Member member = applyService.getMemberNO(memberId);//접속자 정보 DTO member 가져오기
        ApplyDTO applyDTO = applyService.getApplyDTO(member.getMember_no());//해당계정의 회사정보불러오기



        if(applyDTO == null)  {
            System.out.println("if문 안쪽");
            return "redirect:/jobfair/apply/"+jobFairNo;
        }
        int company_no = applyDTO.getCompany_no();
        if(applyDTO != null &&applyService.countEntry(company_no)==0){

        System.out.println("두번째 if문 안쪽");
        applyService.insertEntry(jobFairNo,applyDTO.getCompany_no());
        return "redirect:/jobfair/list";
        }else
            System.out.println("해당사항무");
        return "redirect:/jobfair/list";
    }

    @GetMapping("/apply/{JOBFAIR_NO}")//탁
    public String selectSample(@PathVariable("JOBFAIR_NO") long JOBFAIR_NO ,Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String memberId = authentication.getName();//접속자 아이디 가져오기
        System.out.println("나의 아이디= " + memberId );//접속자 아이디 확인
        Member member = applyService.getMemberNO(memberId);
        List<LocDTO> upperLoc = applyService.getUpperLoc();
        List<JobDTO> upperJob = applyService.getBusiness_type_code_up();
        System.out.println("여기는 apply 컨트롤러");


        model.addAttribute("JOBFAIR_NO", JOBFAIR_NO);
        model.addAttribute("member", member);
        model.addAttribute("upperLoc", upperLoc);
        model.addAttribute("upperJob", upperJob);
        System.out.println(upperLoc);
        System.out.println(upperJob);

        return "jobfair/approvalRequest";
    }


    @PostMapping("/apply/{JOBFAIR_NO}")//탁
    public String insertInfo(@PathVariable("JOBFAIR_NO") long JOBFAIR_NO, @ModelAttribute ApplyDTO applyDTO, @RequestParam("document") MultipartFile[] files, @RequestParam("logo") MultipartFile logoFile){
        System.out.println("!!!!!!!!!!!!!!!!!!!!!!1"+applyDTO);
        System.out.println("여기는 apply post컨트롤러1");
        System.out.println("상세주소"+applyDTO.getCompany_address_detail());

        //여기는 로고첨부
        if (!logoFile.isEmpty()) {
            try {
                String originalFileName = logoFile.getOriginalFilename();
                String uploadDir = "C:\\jobStartUp_fileUpload\\company\\logo"; // 파일을 저장할 경로를 지정하세요.
                UUID uuid = UUID.randomUUID();
                String logo_savname = uuid.toString()+"_"+originalFileName;
                String filePath = uploadDir + File.separator + logo_savname;
                File dest = new File(filePath);
                logoFile.transferTo(dest);

                // 파일 업로드가 성공하면 파일 정보를 applyDTO에 저장하거나 다른 처리를 수행할 수 있습니다.
                System.out.println("originalFilename : " + originalFileName);
                applyDTO.setLogo_orgname(originalFileName); // 사진 원본명 저장
                System.out.println("applyDTO의 logo_orgnamer은 : " + applyDTO.getLogo_orgname());
                applyDTO.setLogo_savname(logo_savname); // 사진 저장명(경로) 저장
            } catch (IOException e) {
                e.printStackTrace();
                // 파일 업로드 중 오류 처리
            }
        }
        System.out.println(applyDTO);


        System.out.println("자료형은"+applyDTO.getCompany_address_code().getClass().getName());
        System.out.println("값은"+applyDTO.getCompany_address_code());
        //여기는 파일첨부
        List<FileDTO> fileDTOList = new ArrayList<>();

        for (MultipartFile file : files) {

            if (!file.isEmpty()) {
                try {
                    String originalFileName = file.getOriginalFilename();
                    String uploadDir = "C:\\jobStartUp_fileUpload\\company\\file"; // 파일을 저장할 경로를 지정하세요.
                    UUID uuid = UUID.randomUUID();
                    String cfile_savname = uuid.toString()+"_"+originalFileName;
                    String filePath = uploadDir + File.separator + cfile_savname;
                    File dest = new File(filePath);
                    file.transferTo(dest);

                    // 파일 업로드가 성공하면 FileDTO에 정보를 저장합니다.
                    FileDTO fileDTO = new FileDTO();
                    fileDTO.setCfile_orgname(originalFileName);
                    //cfile_savname에 uuid+원본파일명

                    fileDTO.setCfile_savname(cfile_savname);
                    fileDTOList.add(fileDTO);
                } catch (IOException e) {
                    e.printStackTrace();
                    // 파일 업로드 중 오류 처리
                }
            }
        }
        System.out.println("applyDTO 인설트 전~~~~~~~~~~~~~~~~~");
        System.out.println("applyDTO의 detail_code_num형태"+ applyDTO.getBusiness_type_code().getClass().getName());
        System.out.println("applyDTO의 detail_code_num값"+ applyDTO.getBusiness_type_code());
        //company테이블입력
        applyService.insertInfo(applyDTO);

        //company_no값을 가져오기
        int company_no= applyService.getCompanyNo().getCompany_no();
        System.out.println("company_no는 ~~~~~~~~" + company_no);
        for (FileDTO fileDTO : fileDTOList) {
            System.out.println("test FileDTO" + fileDTO);
            fileDTO.setCompany_no(company_no);
        }
        applyService.insertFile(fileDTOList);//파일 인설트
        applyService.insertEntry(JOBFAIR_NO,company_no);//잡페어엔트리 인설트
        System.out.println("여기는 apply post컨트롤러2");
        return "redirect:/jobfair/pendingApproval/"+company_no;
    }

    @GetMapping("/pendingApproval/{company_no}")//탁
    public String pendingApproval(@PathVariable("company_no") int company_no,Model model){

        EntryDTO entryDTO = applyService.getEntry(company_no);


        model.addAttribute("entryDTO",entryDTO);


        return "/recruiter/apply/pendingApproval";
    }

    @GetMapping("/companyInfo/{company_no}")//탁
    public String insertTest(@PathVariable("company_no") int company_no,Model model){
        System.out.println("여기는 companyInfo ");
        ApplyDTO applyDTO = applyService.getCompanyInfo(company_no);
        EntryDTO entryDTO = applyService.getEntry(company_no);
        List<FileDTO> fileDTOList = applyService.getFileList(company_no);
        model.addAttribute("applyDTO",applyDTO);
        model.addAttribute("entryDTO",entryDTO);
        model.addAttribute("fileDTOList",fileDTOList);

        return "/recruiter/apply/companyInfo";
    }

    @GetMapping("/jfmodify/{company_no}")//탁
    public String modify(@PathVariable("company_no") int company_no ,Model model) {
        List<FileDTO> fileDTOList = applyService.getFileList(company_no);
        ApplyDTO applyDTO = applyService.getCompanyInfo(company_no);
        List<LocDTO> upperLoc = applyService.getUpperLoc();
        List<JobDTO> upperJob = applyService.getBusiness_type_code_up();
        System.out.println("여기는 modify"+ fileDTOList );
        System.out.println("여기는 modify"+ applyDTO );
        model.addAttribute("fileDTOList",fileDTOList);
        model.addAttribute("applyDTO",applyDTO);
        model.addAttribute("upperLoc", upperLoc);
        model.addAttribute("upperJob", upperJob);



        model.addAttribute("upperLoc", upperLoc);
        model.addAttribute("upperJob", upperJob);
        System.out.println(upperLoc);
        System.out.println(upperJob);
        System.out.println("어버버버버"+applyDTO.getLogo_savname());


        return "recruiter/apply/modify";
    }

    @PostMapping("/jfmodify/{company_no}")//탁
    public String updateInfo(@PathVariable("company_no") int company_no,@ModelAttribute ApplyDTO applyDTO,@RequestParam("document") MultipartFile[] files,@RequestParam("logo") MultipartFile logoFile){
        //여기는 로고첨부

        System.out.println("PostMapping modify: " );
        if (!logoFile.isEmpty()) {
            try {
                String originalFileName = logoFile.getOriginalFilename();
                String uploadDir = "C:\\jobStartUp_fileUpload\\company\\logo"; // 파일을 저장할 경로를 지정하세요.
                UUID uuid = UUID.randomUUID();
                String logo_savname = uuid.toString()+"_"+originalFileName;
                String filePath = uploadDir + File.separator + logo_savname;
                File dest = new File(filePath);
                logoFile.transferTo(dest);

                // 파일 업로드가 성공하면 파일 정보를 applyDTO에 저장하거나 다른 처리를 수행할 수 있습니다.
                System.out.println("originalFilename : " + originalFileName);
                applyDTO.setLogo_orgname(originalFileName); // 사진 원본명 저장
                System.out.println("applyDTO의 logo_orgnamer은 : " + applyDTO.getLogo_orgname());
                applyDTO.setLogo_savname(logo_savname); // 사진 저장명(경로) 저장
            } catch (IOException e) {
                e.printStackTrace();
                // 파일 업로드 중 오류 처리
            }
        }
        System.out.println(applyDTO);
        System.out.println("여까지오나 보자 ㅅㅂ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`");
        //dto에만 저장했음 db에도 넣어줘야함
        List<FileDTO> fileDTOList = new ArrayList<>();
        for (MultipartFile file : files) {
            int check = applyService.existCheck(file.getOriginalFilename(),company_no);
            if (!file.isEmpty() && check ==0) {
                try {
                    String originalFileName = file.getOriginalFilename();
                    String uploadDir = "C:\\jobStartUp_fileUpload\\company\\file"; // 파일을 저장할 경로를 지정하세요.
                    UUID uuid = UUID.randomUUID();
                    String cfile_savname = uuid.toString()+"_"+originalFileName;
                    String filePath = uploadDir + File.separator + cfile_savname;
                    File dest = new File(filePath);
                    file.transferTo(dest);

                    // 파일 업로드가 성공하면 FileDTO에 정보를 저장합니다.
                    FileDTO fileDTO = new FileDTO();
                    fileDTO.setCfile_orgname(originalFileName);
                    //cfile_savname에 uuid+원본파일명

                    fileDTO.setCfile_savname(cfile_savname);
                    fileDTOList.add(fileDTO);
                } catch (IOException e) {
                    e.printStackTrace();
                    // 파일 업로드 중 오류 처리
                }
            }
        }

        applyService.updateInfo(applyDTO);


        for (FileDTO fileDTO : fileDTOList) {
            System.out.println("test FileDTO" + fileDTO);
            fileDTO.setCompany_no(company_no);
        }
        applyService.insertFile(fileDTOList);
        return "redirect:/jobfair/pendingApproval/{company_no}";
    }

    @PostMapping("/jfdelete")//탁
    public ResponseEntity<String> updateComLogo(@RequestParam String cfile_savname, @RequestParam int cfile_no) {
        // Business Logic (파일 삭제)

        String DeletefilePath = "C:\\jobStartUp_fileUpload\\company\\file" + File.separator + cfile_savname;
        File fileToDelete = new File(DeletefilePath);
        System.out.println("jfdeletejfdeletejfdelete 컨트롤러");
        if (fileToDelete.exists() && fileToDelete.delete()) {
            applyService.deleteFile(cfile_no);
            return ResponseEntity.ok("success");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 삭제에 실패했습니다.");
        }
    }

    @PostMapping("/deleteLogo")//탁
    public void modifyRecruiterProfile(
            @RequestParam("currentLogoName") String currentLogoName) {
        //1. 삭제: Logo Delete (saved file delete)
        String DeletefilePath = "C:\\jobStartUp_fileUpload\\company\\logo" + File.separator + currentLogoName;
        System.out.println("값확인"+DeletefilePath);
        File fileToDelete = new File(DeletefilePath);
        fileToDelete.delete();
        System.out.println("여기는 deleteLogo");
        //return "redirect:/recruiter/apply"; // 적절한 리다이렉트 경로로 변경
    }


    @GetMapping("/deleteEntry/{company_no}")//탁
    public String deleteEntry(@PathVariable("company_no") int company_no){

        applyService.deleteEntry(company_no);//job_fair_entry에서 삭제

        return "redirect:/";
    }


    @GetMapping("/wait")//탁
    public String main() {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String memberId = authentication.getName();//접속자 아이디 가져오기
        System.out.println("나의 아이디= " + memberId);//접속자 아이디 확인
        Member member = applyService.getMemberNO(memberId);//접속자 정보 DTO member 가져오기
        ApplyDTO applyDTO = applyService.getApplyDTO(member.getMember_no());//해당계정의 회사정보불러오기


        if (applyDTO == null) {
            return "redirect:/";
        }
        int company_no = applyDTO.getCompany_no();
        if (applyService.countEntry(company_no) > 0) {
            return "redirect:/jobfair/pendingApproval/" + company_no;
        } else
            return "redirect:/";

        /*int countEntry = applyService.countEntry(company_no);//

        if(countEntry>0){
            return "redirect:/jobfair/pendingApproval/"+company_no;
        }else
            return "redirect:/";*/

    }
}