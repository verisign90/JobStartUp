package com.pickmeup.jobstartup.jobfair.controller;

import com.pickmeup.jobstartup.jobfair.dto.JobFairFileDTO;
import com.pickmeup.jobstartup.jobfair.service.JobFairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@RestController
public class ImageUploadController {

    @Autowired
    private JobFairService jobFairService;

    private final static String RELATIVE_PATH = "static/img/jobfair/";
    private final String uploadDir;

    public ImageUploadController() {
        try {
            uploadDir = new ClassPathResource(RELATIVE_PATH).getFile().getAbsolutePath() + File.separator;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("Failed to determine upload directory!", e);
        }
    }

    @PostMapping("/upload")
    public ResponseEntity<?> uploadImage(@RequestParam("upload") MultipartFile file) {
        System.out.println("진입");
        try {
            String originalFilename = file.getOriginalFilename();
            String extension = originalFilename.contains(".") ? originalFilename.substring(originalFilename.lastIndexOf(".")) : "";
            String uuidName = UUID.randomUUID().toString();
            String filename = uuidName + extension;
            originalFilename = originalFilename.substring(0, originalFilename.lastIndexOf("."));

            JobFairFileDTO imageDTO = new JobFairFileDTO();
            imageDTO.setJBFILE_ORGNAME(originalFilename);
            imageDTO.setJBFILE_SAVNAME(uuidName);
            imageDTO.setJBFILE_TYPE(extension);

            File directory = new File(uploadDir);

            if (!directory.exists()) {
                directory.mkdirs();
            }

            File dest = new File(uploadDir + filename);
            file.transferTo(dest);

            jobFairService.save(imageDTO);

            Map<String, String> responseBody = new HashMap<>();
            responseBody.put("uploaded", "true");
            responseBody.put("url", "/img/jobfair/" + filename);

            return ResponseEntity.ok(responseBody);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
