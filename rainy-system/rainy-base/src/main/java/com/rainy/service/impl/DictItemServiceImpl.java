package com.rainy.service.impl;

import com.rainy.entity.DictItem;
import com.rainy.mapper.DictItemMapper;
import com.rainy.service.DictItemService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/5 19:36
 */
@Service
@CacheConfig(cacheNames = "rainy:dictItem")
public class DictItemServiceImpl extends BaseServiceImpl<DictItemMapper, DictItem> implements DictItemService {

    @Override
    @Cacheable(key = "#dictCode")
    public List<DictItem> listByDictCode(String dictCode) {
        return this.lambdaQuery().eq(DictItem::getDictCode, dictCode).list();
    }
}
