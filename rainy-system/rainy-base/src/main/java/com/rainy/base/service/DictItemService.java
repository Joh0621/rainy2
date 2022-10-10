package com.rainy.base.service;

import com.rainy.base.entity.DictItem;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/5 19:27
 */
public interface DictItemService extends BaseService<DictItem> {

    List<DictItem> listByDictCode(String dictCode);
    boolean updateById(DictItem dictItem);
}
