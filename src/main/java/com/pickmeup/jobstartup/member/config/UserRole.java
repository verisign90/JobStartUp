package com.pickmeup.jobstartup.member.config;

import lombok.Getter;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.Set;
import java.util.stream.Collectors;

@Getter
public enum UserRole {
    COMMON(Set.of("COMMON")),
    COMPANY(Set.of("COMPANY")),
    ADMIN(Set.of("ADMIN")),
    UNAPPROVED_COMPANY(Set.of("UNAPPROVED_COMPANY"));

    private final Set<String> permissions;

    UserRole(Set<String> permissions) {
        this.permissions = permissions;
    }

    public Set<SimpleGrantedAuthority> getGrantedAuthorities() {
        Set<SimpleGrantedAuthority> permissions = getPermissions().stream()
            .map(SimpleGrantedAuthority::new)
            .collect(Collectors.toSet());
        return permissions;
    }
}

//@Getter
//public enum UserRole {
//    COMMON("COMMON"),
//    COMPANY("COMPANY"),
//    ADMIN("ADMIN"),
//    UNAPPROVED_COMPANY("UNAPPROVED_COMPANY");
//
//    private final String permission;
//
//    UserRole(String permission) {
//        this.permission = permission;
//    }
//
//    public SimpleGrantedAuthority getGrantedAuthority() {
//        return new SimpleGrantedAuthority(permission);
//    }
//}