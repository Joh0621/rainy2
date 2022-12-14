package com.rainy.framework.enums;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/10/4 19:51
 */
public enum LoginType {

    LOGIN(0, "登录"),
    LOGOUT(1, "注销"),
    KICK_OUT(2, "被踢下线"),
    REPLACED(3, "被顶下线"),
    DISABLE(4, "被锁定"),
    UNTIE_DISABLE(5, "解除锁定");

    private final int code;
    private final String name;

    LoginType(int code, String name) {
        this.code = code;
        this.name = name;
    }

    public int getCode() {
        return code;
    }

    public String getName() {
        return name;
    }
}
