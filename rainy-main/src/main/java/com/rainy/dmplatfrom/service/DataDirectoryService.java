package com.rainy.dmplatfrom.service;

import com.rainy.dmplatfrom.entity.DataDirectory;
import com.rainy.service.BaseService;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/15 10:27
 */
public interface DataDirectoryService extends BaseService<DataDirectory> {

    List<DataDirectory> tree();

}
