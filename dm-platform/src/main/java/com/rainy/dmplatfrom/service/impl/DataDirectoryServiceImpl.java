package com.rainy.dmplatfrom.service.impl;

import com.rainy.system.service.impl.BaseServiceImpl;
import com.rainy.dmplatfrom.entity.DataDirectory;
import com.rainy.dmplatfrom.entity.Device;
import com.rainy.dmplatfrom.mapper.DataDirectoryMapper;
import com.rainy.dmplatfrom.service.DataDirectoryService;
import com.rainy.dmplatfrom.service.DeviceService;
import com.rainy.dmplatfrom.service.PointService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/15 10:28
 */
@Service
@RequiredArgsConstructor
public class DataDirectoryServiceImpl extends BaseServiceImpl<DataDirectoryMapper, DataDirectory> implements DataDirectoryService {

    private final DeviceService deviceService;
    private final PointService pointService;

    @Override
    public List<DataDirectory> tree() {
        List<DataDirectory> dataDirectories = this.list();
        // 1.找出父节点
        List<DataDirectory> parents = dataDirectories.stream()
                .filter(dataDirectory -> dataDirectory.getParentId() == 0)
                .toList();
        // 2.为父节点设置子节点
        parents.forEach(parent -> {
            parent.setChildren(getChildren(parent.getId(), dataDirectories));
        });
        return parents;
    }

    @Override
    public boolean removeBatchByIds(List<Long> ids) {
        // 1.删除数据目录
        super.removeBatchByIds(ids);
        // 2.删除目录下所有设备
        deviceService.lambdaUpdate()
                .in(Device::getDataDirectoryId, ids)
                .remove();
        // 3.删除点码 todo
        return true;
    }

    private List<DataDirectory> getChildren(Long id, List<DataDirectory> dataDirectories) {
        // 1.找出子节点
        List<DataDirectory> children = dataDirectories.stream()
                .filter(dataDirectory -> Objects.equals(id, dataDirectory.getParentId()))
                .toList();
        // 2.为子节点设置子节点
        children.forEach(dataDirectory -> {
            dataDirectory.setChildren(getChildren(dataDirectory.getId(), dataDirectories));
        });
        return children;
    }

}
