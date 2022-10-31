package com.rainy.dmplatfrom.service.impl;

import com.rainy.dmplatfrom.entity.Device;
import com.rainy.dmplatfrom.entity.Point;
import com.rainy.dmplatfrom.mapper.DeviceMapper;
import com.rainy.dmplatfrom.service.DeviceService;
import com.rainy.dmplatfrom.service.PointService;
import com.rainy.system.service.impl.BaseServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/20 11:22
 */
@Service
@RequiredArgsConstructor
public class DeviceServiceImpl extends BaseServiceImpl<DeviceMapper, Device> implements DeviceService {

    private final PointService pointService;

    @Override
    @Transactional
    public boolean removeBatchByIds(List<Long> ids) {
        List<Device> list = this.lambdaQuery()
                .in(Device::getId, ids).list();
        // 删除设备下点码
        if (!list.isEmpty()) {
            List<String> codes = list.stream()
                    .map(Device::getCode)
                    .toList();
            pointService.lambdaUpdate()
                    .in(Point::getDeviceCode, codes)
                    .remove();
        }
        return super.removeBatchByIds(ids);
    }

    @Override
    public List<Map<String, Object>> stationPointCount() {
        return this.baseMapper.stationPointCount();
    }

    @Override
    public List<Map<String, Object>> majorPointCount() {
        return this.baseMapper.majorPointCount();
    }

    @Override
    public List<Map<String, Object>> majorDeviceCount() {
        return this.baseMapper.majorDeviceCount();
    }

    @Override
    public List<Map<String, Object>> stationDeviceCount() {
        return this.baseMapper.stationDeviceCount();
    }
}
