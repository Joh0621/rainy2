package com.renguangli.rainy.common;

import cn.hutool.core.util.StrUtil;
import lombok.Data;

/**
 * data-middle-platform
 *
 * @author renguangli
 * @date 2022/9/1 17:43
 */
@Data
public class Result<T> {

    private int code;
    private boolean success;
    private String message;
    private T data;

    public Result() {}

    public Result(int code, boolean success, String message, T data) {
        this.code = code;
        this.success = success;
        this.message = message;
        this.data = data;
    }

    public static <T> Result<T> ok() {
        return new Result<>(ResultCode.SUCCESS.getCode(), true, ResultCode.SUCCESS.getMessage(), null);
    }

    public static <T> Result<T> of(T data) {
        return new Result<>(ResultCode.SUCCESS.getCode(), true, ResultCode.SUCCESS.getMessage(), data);
    }

    public static <T> Result<T> of(ResultCode resultCode) {
        return new Result<>(resultCode.getCode(), false, resultCode.getMessage(), null);
    }

    public static <T> Result<T> of(ResultCode resultCode, Object... params) {
        return new Result<>(resultCode.getCode(), false, StrUtil.format(resultCode.getMessage(), params), null);
    }

    public static <T> Result<T> of(ResultCode resultCode, String message, Object... params) {
        return new Result<>(resultCode.getCode(), false, StrUtil.format(message, params), null);
    }

}
