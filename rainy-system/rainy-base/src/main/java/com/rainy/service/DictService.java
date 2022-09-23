package com.rainy.service;

import com.rainy.entity.Dict;

import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/5 19:27
 */
public interface DictService extends BaseService<Dict> {

    Map<String, Map<String, Object>> getDictTree();

}
