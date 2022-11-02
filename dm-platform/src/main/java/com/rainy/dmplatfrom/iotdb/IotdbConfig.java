package com.rainy.dmplatfrom.iotdb;

import org.apache.iotdb.session.pool.SessionPool;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 22:03
 */
@Configuration
public class IotdbConfig {

    @Bean
    public SessionPool sessionPool(){
        return new SessionPool("24.43.102.240", 6667, "root", "root", 5000);
    }
}
