package com.rainy.dmplatfrom.service;

import com.rainy.system.service.BaseService;
import com.rainy.dmplatfrom.entity.Device;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/20 11:22
 */
public interface DeviceService extends BaseService<Device> {

    boolean removeBatchByIds(List<Long> ids);
}