package com.pickmeup.jobstartup.admin.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.pickmeup.jobstartup.admin.service.EntryService;
import com.pickmeup.jobstartup.jobfair.dto.EntryCompanyDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class EntryController {

    @Autowired
    private EntryService entryService;

    @GetMapping("/entry/list")
    public String entryCompanyList(@RequestParam(value = "page", defaultValue = "1") int page,
                                   @RequestParam(value = "size", defaultValue = "10") int size, Model model) {
        ObjectMapper mapper = new ObjectMapper();
        mapper.registerModule(new JavaTimeModule());

        try {
            Map<String, Object> paginationResult = entryService.getAllEntryCompany(page, size);
            List<EntryCompanyDTO> entryCompanyList = (List<EntryCompanyDTO>) paginationResult.get("entryCompanyList");
            System.out.println(entryCompanyList);
            int totalPages = (int) paginationResult.get("totalPages");

            model.addAttribute("entryCompanyList", entryCompanyList);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("currentPage", page);

            String entryCompanyJson = mapper.writeValueAsString(entryService.getAllEntryCompany());
            model.addAttribute("entryCompanyJson", entryCompanyJson);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }

        return "/admin/entry_list";
    }

    @GetMapping("/entry/apply")
    public String applyEntryCompany(@Param("jobFairEntryNo") Long jobFairEntryNo, @Param("companyNo") Long companyNo) {
        entryService.applyEntryCompany(jobFairEntryNo, companyNo);

        return "redirect:/admin/entry/list";
    }


    @GetMapping("/entry/reject")
    public String rejectEntryCompany(@Param("jobFairEntryNo") Long jobFairEntryNo, @Param("companyNo") Long companyNo) {
        entryService.rejectEntryCompany(jobFairEntryNo, companyNo);

        return "redirect:/admin/entry/list";
    }


}
