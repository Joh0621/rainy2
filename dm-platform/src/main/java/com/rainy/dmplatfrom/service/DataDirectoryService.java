package com.rainy.dmplatfrom.service;

import com.rainy.dmplatfrom.entity.DataDirectory;
import com.rainy.system.service.BaseService;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/15 10:27
 */
public interface DataDirectoryService extends BaseService<DataDirectory> {

    List<DataDirectory> tree();

    boolean removeBatchByIds(List<Long> ids);
}
