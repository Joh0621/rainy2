package com.rainy.dmplatfrom.service;

import com.rainy.dmplatfrom.entity.Device;
import com.rainy.system.service.BaseService;

import java.util.List;
import java.util.Map;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/20 11:22
 */
public interface DeviceService extends BaseService<Device> {

    boolean removeBatchByIds(List<Long> ids);

    List<Map<String, Object>> stationPointCount();

    List<Map<String, Object>> stationDeviceCount();

}
