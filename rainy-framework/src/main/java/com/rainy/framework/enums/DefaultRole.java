package com.rainy.framework.enums;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/2 21:48
 */
public enum DefaultRole {

    SUPPER_ADMIN("role_superAdmin", "超级管理员"),
    ADMIN("role_admin", "系统管理员"),
    AUDIT("role_audit", "审计管理员"),
    DEFAULT("role_default", "默认角色");

    private final String code;
    private final String name;

    DefaultRole(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

}
