package com.rainy.framework.exception;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/19 18:33
 */
public class BizException extends RuntimeException {

    public BizException(String message) {
       super(message);
    }

    public BizException(String message, Throwable e) {
        super(message, e);
    }

}
