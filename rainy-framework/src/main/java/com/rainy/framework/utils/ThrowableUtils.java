package com.rainy.framework.utils;

import com.rainy.framework.constant.CharConstants;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/4 19:43
 */
public class ThrowableUtils {

    /**
     * 转换异常信息为字符串
     * @param e   异常
     */
    public static String toString(Throwable e) {
        StringBuilder stackTrace = new StringBuilder();
        for (StackTraceElement stackTraceElement : e.getStackTrace()) {
            stackTrace.append(stackTraceElement).append(CharConstants.LF);
        }
        return e.getClass().getName() + CharConstants.COLON + e.getMessage() + CharConstants.LF + stackTrace;
    }

}
