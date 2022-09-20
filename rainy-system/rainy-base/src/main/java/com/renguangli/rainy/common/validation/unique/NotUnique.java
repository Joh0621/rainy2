package com.renguangli.rainy.common.validation.unique;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

/**
 * 重复校验注解
 *
 * @author Created by renguangli at 2022/9/19 21:39
 */
@Documented
@Constraint(validatedBy = { NotUniqueConstraintValidator.class})
@Target({ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface NotUnique {

    Class<?> entity();

    String field() default "name";

    //在 jsr303 中一个注解必须有下面三个属性
    String message() default "已存在!";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
