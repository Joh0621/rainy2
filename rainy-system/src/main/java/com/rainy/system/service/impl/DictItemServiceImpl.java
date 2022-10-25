package com.rainy.system.service.impl;

import com.rainy.system.entity.DictItem;
import com.rainy.system.mapper.DictItemMapper;
import com.rainy.system.service.DictItemService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/5 19:36
 */
@Service
@CacheConfig(cacheNames = "rainy:dictItems")
public class DictItemServiceImpl extends BaseServiceImpl<DictItemMapper, DictItem> implements DictItemService {

    @Override
    @CacheEvict(key = "#dictItem.dictCode")
    public boolean save(DictItem dictItem) {
        return super.save(dictItem);
    }

    @Override
    @Cacheable(key = "#dictCode")
    public List<DictItem> listByDictCode(String dictCode) {
        return this.lambdaQuery().eq(DictItem::getDictCode, dictCode).list();
    }

    @Override
    @CacheEvict(key = "#dictItem.dictCode")
    public boolean updateById(DictItem dictItem) {
        return super.updateById(dictItem);
    }

    @Override
    @Cacheable(key = "#dictCode + #value")
    public String getCodeByDictCodeAndValue(String dictCode, String value) {
        DictItem dictItem = this.lambdaQuery()
                .eq(DictItem::getDictCode, dictCode)
                .eq(DictItem::getValue, value)
                .one();
        return dictItem == null ? null : dictItem.getCode();
    }
}
