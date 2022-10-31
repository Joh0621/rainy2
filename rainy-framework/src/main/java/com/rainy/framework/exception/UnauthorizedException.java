package com.rainy.framework.exception;

import com.rainy.framework.common.ResultCode;
import lombok.Getter;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/10/9 18:36
 */
@Getter
public class UnauthorizedException extends RuntimeException {

    private final ResultCode resultCode = ResultCode.UNAUTHORIZED;;

    public UnauthorizedException(String message) {
        super(message);
    }

}
