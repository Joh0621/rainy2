package com.renguangli.rainy.dmplatfrom.service.impl;

import com.renguangli.rainy.dmplatfrom.entity.DataDirectory;
import com.renguangli.rainy.dmplatfrom.mapper.DataDirectoryMapper;
import com.renguangli.rainy.dmplatfrom.service.DataDirectoryService;
import com.renguangli.rainy.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/15 10:28
 */
@Service
public class DataDirectoryServiceImpl extends BaseServiceImpl<DataDirectoryMapper, DataDirectory> implements DataDirectoryService {

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
