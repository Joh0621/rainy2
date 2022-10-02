package com.rainy.base.common;

/**
 * http 响应吗
 *
 * @author created by renguangli at 2022/9/1 17:44
 */
public enum ResultCode {

    /**
     * success
     */
    SUCCESS(200, "操作成功！"),

    ILLEGAL_REQUEST(400, "非法请求，未知请求来源,referer:{}"),
    BAD_REQUEST(400, "参数校验失败，{}"),

    UNAUTHORIZED(401, "未登录！"),
    ACCOUNT_PASSWORD_NOT_MATCH(401, "账号与密码不匹配!"),
    ACCOUNT_NOT_ACTIVATE(401, "账号未激活!"),
    ACCOUNT_EXPIRED(401, "您的账号已过期，请联系管理员！"),
    PASSWORD_EXPIRED(401, "您的密码已过期，请修改密码！"),

    UNAUTHORIZED2(402, "请输入正确的密码!"),
    FORBIDDEN(403, "Forbidden."),
    NOT_FOUND(404, "Not Found."),
    METHOD_NOT_ALLOW(405, "Request method not supported."),

    INTERNAL_SERVER_ERROR(500, "服务器发生错误，请联系管理员！");

    private final int code;
    private final String message;

    ResultCode(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

}
