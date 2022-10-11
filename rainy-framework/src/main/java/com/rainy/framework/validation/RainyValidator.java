package com.rainy.framework.validation;

import com.rainy.framework.constant.CommonConstants;
import com.rainy.framework.utils.WebUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.lang.NonNull;
import org.springframework.validation.Errors;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

import java.beans.PropertyDescriptor;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/20 0020 22:36
 */
@Slf4j
public class RainyValidator extends LocalValidatorFactoryBean {

    @Override
    public void validate(@NonNull Object target, @NonNull Errors errors, @NonNull Object... validationHints) {
        Object id = getIdValue(target);
        if (id != null) {
            WebUtils.getRequest().setAttribute(CommonConstants.ID, id);
        }
        super.validate(target, errors, validationHints);
    }

    /**
     * 获取参数中的id的值，如果没有id字段就返回null
     */
    private Object getIdValue(Object target) {
        try {
            PropertyDescriptor propertyDescriptor = new PropertyDescriptor(CommonConstants.ID, target.getClass());
            return propertyDescriptor.getReadMethod().invoke(target);
        } catch (Exception e) {
            log.error("参数[id]获取失败：{}", e.getMessage(), e);
        }
        return null;
    }
}
