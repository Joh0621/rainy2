package com.rainy.framework.config;

import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.stp.StpUtil;
import com.rainy.framework.validation.RainyValidator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.validation.Validator;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/20 22:46
 */
@EnableWebMvc
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    private static final String INCLUDE_PATH_PATTERN = "/**";
    private static final String[] EXCLUDE_PATHS = {
            "/favicon.ico", "/error", "/druid/**",
            "/interface-ui/**", "/api/**"
    };

    // 注册Sa-Token的注解拦截器，打开注解式鉴权功能
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册注解拦截器，并排除不需要注解鉴权的接口地址 (与登录拦截器无关)
        SaInterceptor interceptor = new SaInterceptor((handler) -> {
            StpUtil.checkLogin();
            // 二级认证
//            SaRouter.match("/user", () -> {
//                // 匹配请求方法
//                SaRouter.matchMethod("POST").check(saRouterStaff -> {
//                    StpUtil.checkSafe();
//                });
//            });
        });
        registry.addInterceptor(interceptor)
                .addPathPatterns(INCLUDE_PATH_PATTERN)
                .excludePathPatterns(EXCLUDE_PATHS);
    }

    @Override
    public Validator getValidator() {
        return validator();
    }

    @Bean
    public Validator validator() {
        return new RainyValidator();
    }

}
