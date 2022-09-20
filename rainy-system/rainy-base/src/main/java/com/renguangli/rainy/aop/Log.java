package com.renguangli.rainy.aop;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * 操作日志注解
 *
 * @author created by renguangli at 2022/9/2 11:00
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface Log {

    /**
     * 系统模块
     *
     * @return string
     */
    String module() default "";

    /**
     * 操作类型
     *
     * @return string
     */
    String type() default "";

    /**
     * 操作详情
     *
     * @return string
     */
    String detail() default "";

    /**
     * 是否保存请求参数
     *
     * @return string
     */
    boolean paramSaved() default true;

    /**
     * 是否保存响应结果
     *
     * @return string
     */
    boolean resSaved() default true;
}
