package com.rainy.base.common.utils;

import cn.hutool.core.util.StrUtil;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/19 21:11
 */
public class ValidateUtils {

    public static void isContains(String str1, String str2, String message, Object... variables) {
        if (str1 == null || str2 == null) {
            return;
        }
        if (str1.contains(str2)) {
            throw new IllegalArgumentException(StrUtil.format(message, variables));
        }
    }

    public static void isEquals(String str1, String str2, String message, Object... variables) {
        if (str1 == null || str2 == null) {
            return;
        }
        if (StrUtil.equals(str1, str2)) {
            throw new IllegalArgumentException(StrUtil.format(message, variables));
        }
    }

    public static void isTrue(boolean expression, String message, Object... variables) {
        if (expression) {
            throw new IllegalArgumentException(StrUtil.format(message, variables));
        }
    }
}
