package com.rainy.system.service;

import com.rainy.system.entity.Dict;

import java.util.List;
import java.util.Map;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/5 19:27
 */
public interface DictService extends BaseService<Dict> {

    Map<String, Map<String, Object>> getDictTree();

    /**
     * 删除字典以及字典项
     *
     * @param ids ids
     * @return boolean
     */
    boolean removeBatchByIds(List<Long> ids);
}
