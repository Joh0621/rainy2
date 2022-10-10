package com.rainy.dmplatfrom.service;

import com.rainy.base.service.BaseService;
import com.rainy.dmplatfrom.entity.DataDirectory;

import java.util.Collection;
import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/15 10:27
 */
public interface DataDirectoryService extends BaseService<DataDirectory> {

    List<DataDirectory> tree();

    boolean removeBatchByIds(List<Long> ids);
}
