package com.pickmeup.jobstartup.common.entity;

public enum MemberType {
    COMMON("1"),
    COMPANY("2"),
    ADMIN("3"),
    UNAPPROVED_COMPANY("4");

    private final String code;

    MemberType(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    //DB에서 값을 읽어올 때 "1" -> COMMON으로 변환
    public static MemberType valueOfCode(String code) {
        for (MemberType type : values()) {
            if (type.getCode().equals(code)) {
                return type;
            }
        }
        throw new IllegalArgumentException("No MemberType for code: " + code);
    }
}

