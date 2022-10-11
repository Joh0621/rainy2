package com.rainy.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.rainy.system.entity.Config;
import com.rainy.system.mapper.ConfigMapper;
import com.rainy.system.service.ConfigService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/5 17:17
 */
@Service
@CacheConfig(cacheNames = "rainy:config")
public class ConfigServiceImpl extends BaseServiceImpl<ConfigMapper, Config> implements ConfigService {

    @Override
    @Cacheable(key = "#code")
    public String get(String code) {
        QueryWrapper<Config> qw = new QueryWrapper<>();
        qw.select("value").eq("code", code);
        Config config = this.baseMapper.selectOne(qw);
        return config == null ? null : config.getValue();
    }

    @Override
    @Cacheable(key = "#code") // aop 方法自调用不会生效
    public int getAsInt(String code) {
        return Integer.parseInt(get(code));
    }

    @Override
    @Cacheable(key = "#code") // aop 方法自调用不会生效
    public boolean getAsBoolean(String code) {
        return Boolean.parseBoolean(get(code));
    }

    @Override
    @CacheEvict(key = "#config.code")
    public boolean update(Config config) {
        return this.updateById(config);
    }

}
