package com.rainy.system.service;

import com.rainy.system.entity.DictItem;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/5 19:27
 */
public interface DictItemService extends BaseService<DictItem> {

    List<DictItem> listByDictCode(String dictCode);
    boolean updateById(DictItem dictItem);
}
