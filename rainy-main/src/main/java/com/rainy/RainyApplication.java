package com.rainy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * spring-boot 启动类
 *
 * @author Created by renguangli at 2022/9/13 17:33
 */
@SpringBootApplication
public class RainyApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(RainyApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(RainyApplication.class);
    }

}
