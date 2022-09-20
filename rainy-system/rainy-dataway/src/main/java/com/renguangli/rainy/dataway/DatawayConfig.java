package com.renguangli.rainy.dataway;

import net.hasor.spring.boot.EnableHasor;
import net.hasor.spring.boot.EnableHasorWeb;
import org.springframework.context.annotation.Configuration;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/20 0020 22:28
 */
@EnableHasor    // 在Spring 中启用 Hasor
@EnableHasorWeb(path = {"/interface-ui/**", "/**"})
@Configuration
public class DatawayConfig {

}
