package com.rainy.base.config;

import com.rainy.base.common.validation.RainyValidator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.validation.Validator;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/20 22:46
 */
@EnableWebMvc
@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {

    @Override
    public Validator getValidator() {
        return validator();
    }

    @Bean
    public Validator validator() {
        return new RainyValidator();
    }

}
