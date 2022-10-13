package com.rainy.dmplatfrom.service.impl;

import com.rainy.dmplatfrom.entity.Point;
import com.rainy.dmplatfrom.mapper.PointMapper;
import com.rainy.dmplatfrom.service.PointService;
import com.rainy.system.service.impl.BaseServiceImpl;
import com.rainy.dmplatfrom.entity.Device;
import com.rainy.dmplatfrom.mapper.DeviceMapper;
import com.rainy.dmplatfrom.service.DeviceService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
}
