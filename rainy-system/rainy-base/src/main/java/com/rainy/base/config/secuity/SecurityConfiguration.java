package com.rainy.base.config.secuity;

import cn.dev33.satoken.context.SaHolder;
import cn.dev33.satoken.exception.*;
import cn.dev33.satoken.filter.SaServletFilter;
import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.router.SaRouter;
import cn.dev33.satoken.stp.StpUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rainy.base.common.Result;
import com.rainy.base.common.ResultCode;
import com.rainy.base.common.constant.ConfigConstants;
import com.rainy.base.service.ConfigService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.Resource;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/13 18:09
 */
@EnableWebMvc
@Configuration
public class SecurityConfiguration implements WebMvcConfigurer {

    private static final Logger log = LoggerFactory.getLogger(SecurityConfiguration.class);

    private static final String INCLUDE_PATH_PATTERN = "/**";
    private static final String[] EXCLUDE_PATHS = {
            "/favicon.ico", "/error", "/druid/**"
    };

    @Resource
    private ObjectMapper objectMapper;
    @Resource
    private ConfigService configService;

    // 注册Sa-Token的注解拦截器，打开注解式鉴权功能
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册注解拦截器，并排除不需要注解鉴权的接口地址 (与登录拦截器无关)
        SaInterceptor interceptor = new SaInterceptor((handler) -> {
            StpUtil.checkLogin();
        });
        registry.addInterceptor(interceptor)
                .addPathPatterns(INCLUDE_PATH_PATTERN)
                .excludePathPatterns(EXCLUDE_PATHS);
    }

//    @Bean
//    public SaServletFilter saServletFilter() {
//        return new SaServletFilter()
//                .addInclude(INCLUDE_PATH_PATTERN)  // 指定认证的请求路径
//                .addExclude(EXCLUDE_PATHS)  // 指定放行请求路径
//                .setAuth(this::auth) // 认证函数: 每次请求执行
//                .setError(this::error) // 异常处理函数：每次认证函数发生异常时执行此函数
//                .setBeforeAuth(this::beforeAuth);  // 前置函数：在每次认证函数之前执行
//    }

    private void auth(Object r) {
        // 登录验证
        SaRouter.match(INCLUDE_PATH_PATTERN, StpUtil::checkLogin);
        // 演示环境无法进行增删改操作
        boolean isDemoDev = configService.getAsBoolean(ConfigConstants.IS_DEMO_DEV);
        if (isDemoDev) {
            SaRouter.matchMethod(HttpMethod.GET.name()).check(() -> {
                throw new RuntimeException("演示环境, 无法操作！");
            });
        }

        // 二级认证
        SaRouter.match("/user", () -> {
            // 匹配请求方法
            SaRouter.matchMethod("POST").check(saRouterStaff -> {
                StpUtil.checkSafe();
            });
        });
    }

    private String error(Throwable e) {
        ResultCode resultCode =  ResultCode.INTERNAL_SERVER_ERROR;
        if (e instanceof NotLoginException || e instanceof DisableServiceException) { // 认证异常
            resultCode = ResultCode.UNAUTHORIZED;
        } else if (e instanceof NotSafeException) { // 二级认证异常
            resultCode = ResultCode.UNAUTHORIZED2;
        } else if (e instanceof NotRoleException || e instanceof NotPermissionException) { // 无权限异常
            resultCode = ResultCode.FORBIDDEN;
        } else { // 其他异常打印日志
            log.error(e.getMessage(), e);
        }
        return buildError(resultCode, e.getMessage());
    }

    private void beforeAuth(Object r) {
        SaHolder.getResponse().setHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);
        // do something
    }

    private String buildError(ResultCode resultCode, String message) {
        try {
            return objectMapper.writeValueAsString(Result.of(resultCode, message));
        } catch (JsonProcessingException e) {
            log.error(e.getMessage(), e);
            return e.getMessage();
        }
    }

}
