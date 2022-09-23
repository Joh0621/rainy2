package com.rainy.workflow.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/23 13:07
 */
@Configuration
public class CamundaConfig {

//    @Bean(name="camundaBpmDataSource")
//    @ConfigurationProperties(prefix="camunda.datasource")
//    public DataSource camundaBpmDataSource() {
//        return DataSourceBuilder.create().build();
//    }

}
