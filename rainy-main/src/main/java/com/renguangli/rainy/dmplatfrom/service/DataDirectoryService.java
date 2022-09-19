package com.renguangli.rainy.dmplatfrom.service;

import com.renguangli.rainy.dmplatfrom.entity.DataDirectory;
import com.renguangli.rainy.service.BaseService;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/15 10:27
 */
public interface DataDirectoryService extends BaseService<DataDirectory> {

    List<DataDirectory> tree();

}
