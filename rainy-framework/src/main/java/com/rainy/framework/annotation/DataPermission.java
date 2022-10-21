package com.rainy.framework.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/21 09:36
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface DataPermission {

    /**
     * 默认数据权限字段
     *
     * @return {@link String}
     */
    String value() default "org_id";

    /**
     * 数据权限字段
     *
     * @return {@link String}
     */
    String field() default "";

}
