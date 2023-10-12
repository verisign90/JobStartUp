package com.pickmeup.jobstartup.member.service;

import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Service
public class AgeService {
    public int calculateAge(String birthdate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        LocalDate birthDate = LocalDate.parse(birthdate, formatter);
        LocalDate currentDate = LocalDate.now();

        int age = currentDate.getYear() - birthDate.getYear();

        if (birthDate.plusYears(age).isAfter(currentDate)) {
            age--;
        }

        return age;
    }
}