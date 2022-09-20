package com.renguangli.rainy.controller;

import com.renguangli.rainy.common.constant.DictConstants;
import com.renguangli.rainy.entity.Config;
import com.renguangli.rainy.service.ConfigService;
import com.renguangli.rainy.service.DictService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/5 19:53
 */
@RestController
@RequiredArgsConstructor
public class CommonController {

    private final DictService dictService;
    private final ConfigService configService;

    @GetMapping("/common")
    public Map<String, Object> common() {
        Map<String, Object> data = new LinkedHashMap<>();
        // 1.字典树
        data.put("dictTree", dictService.getDictTree());
        // 2.系统配置
        Map<String, Object> config = new HashMap<>();
        List<Config> configs = configService.lambdaQuery()
                .eq(Config::getCategoryCode, DictConstants.CONFIG_CATEGORY_SYSTEM)
                .list();
        configs.forEach(v -> config.put(v.getCode(), v.getValue()));
        data.put("config", config);
        return data;
    }

}
