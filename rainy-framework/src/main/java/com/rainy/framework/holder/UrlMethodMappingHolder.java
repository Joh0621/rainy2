package com.rainy.framework.holder;

import cn.hutool.core.stream.CollectorUtil;
import com.rainy.framework.constant.CharConstants;
import com.rainy.framework.utils.WebUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.condition.PatternsRequestCondition;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/21 11:17
 */
@Component
@RequiredArgsConstructor
public class UrlMethodMappingHolder implements CommandLineRunner {

    private static final Map<String, Method> URL_METHOD_MAPPING = new HashMap<>();

    private final RequestMappingInfoHandlerMapping requestMappingHandlerMapping;

    public static Method getCurrentControllerMethod() {
        String key = WebUtils.getServletPath()
                + CharConstants.RUNG
                + WebUtils.getRequestMethod();
        return URL_METHOD_MAPPING.get(key);
    }

    @Override
    public void run(String... args) {
        // 获取url与方法的对应信息
        Map<RequestMappingInfo, HandlerMethod> map = requestMappingHandlerMapping.getHandlerMethods();
        for (Map.Entry<RequestMappingInfo, HandlerMethod> entry : map.entrySet()) {
            RequestMappingInfo info = entry.getKey();
            PatternsRequestCondition patternsCondition = info.getPatternsCondition();
            if (patternsCondition == null) {
                continue;
            }
            Set<String> patterns = patternsCondition.getPatterns();
            List<String> methodNames = getMethodNames(info.getMethodsCondition().getMethods());
            patterns.forEach(url -> {
                Method method = entry.getValue().getMethod();
                methodNames.forEach(methodName -> {
                    String key = url + CharConstants.RUNG + methodName;
                    URL_METHOD_MAPPING.put(key, method);
                });
            });
        }
    }

    private List<String> getMethodNames(Set<RequestMethod> methods) {
        return methods.stream()
                .map(RequestMethod::name)
                .toList();
    }
}
