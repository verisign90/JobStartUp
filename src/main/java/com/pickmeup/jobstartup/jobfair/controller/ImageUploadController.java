package com.pickmeup.jobstartup.jobfair.controller;

import com.pickmeup.jobstartup.jobfair.dto.JobFairFileDTO;
import com.pickmeup.jobstartup.jobfair.service.JobFairService;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.*;

@RestController
public class ImageUploadController {

    @Autowired
    private JobFairService jobFairService;

    private final String RELATIVE_PATH = "src/main/resources/static/img/jobfair/";
    private String uploadDir;

    @PostConstruct
    public void init() {
        uploadDir = Paths.get("").toAbsolutePath().toString() + File.separator + RELATIVE_PATH;
        System.out.println("Path: " + uploadDir);
    }

    @PostMapping("/upload")
    public ResponseEntity<?> uploadImage(@RequestParam("upload") MultipartFile image) {
        try {
            String originalFilename = image.getOriginalFilename();
            String extension = originalFilename.contains(".") ? originalFilename.substring(originalFilename.lastIndexOf(".")) : "";
            String uuidName = UUID.randomUUID().toString();
            String filename = uuidName + extension;

            File directory = new File(uploadDir);

            if (!directory.exists()) {
                directory.mkdirs();
            }

            File dest = new File(uploadDir + filename);
            image.transferTo(dest);

            Map<String, String> responseBody = new HashMap<>();
            responseBody.put("uploaded", "true");
            responseBody.put("url", "/img/jobfair/" + filename);

            System.out.println(uploadDir);
            return ResponseEntity.ok(responseBody);
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PostMapping("/uploadlogo")
    public ResponseEntity<?> uploadLogo(@RequestParam("logo") MultipartFile logo) {
        try {
            String originalFilename = logo.getOriginalFilename();
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
            logo.transferTo(dest);

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
