package com.rainy.dmplatfrom.service.impl;

import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.StrUtil;
import com.rainy.dmplatfrom.entity.AllData;
import com.rainy.dmplatfrom.entity.DataDirectory;
import com.rainy.dmplatfrom.entity.Device;
import com.rainy.dmplatfrom.entity.Point;
import com.rainy.dmplatfrom.service.DataDirectoryService;
import com.rainy.dmplatfrom.service.DeviceService;
import com.rainy.dmplatfrom.service.ExcelService;
import com.rainy.dmplatfrom.service.PointService;
import com.rainy.framework.constant.DictConstants;
import com.rainy.system.entity.Dict;
import com.rainy.system.entity.DictItem;
import com.rainy.system.service.DictItemService;
import com.rainy.system.service.DictService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/13 17:39
 */
@Service
@RequiredArgsConstructor
public class ExcelServiceImpl implements ExcelService {

    private final DataDirectoryService dataDirectoryService;
    private final DeviceService deviceService;
    private final PointService pointService;
    private final DictService dictService;
    private final DictItemService dictItemService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveAll(List<Map<String, List<AllData>>> allData) {
        allData.forEach(data -> {
            data.forEach((sheetName,value) -> {
                // 1.数据目录
                DataDirectory dataDirectory = getDataDirectory(sheetName);
                // 2.设备,点码
                Map<String, List<AllData>> deviceData = value.stream()
                        .collect(Collectors.groupingBy(AllData::getDeviceName));
                deviceData.forEach((key, val) -> {
                    Device device = getDevice(key, dataDirectory);
                    List<Point> points = new ArrayList<>();
                    int i = 0;
                    for (AllData d : val) {
                        String deviceCode = d.getPointCode().substring(0, 13);
                        if (i == 0) {
                            device.setCode(deviceCode);
                            String major = getDictItemCode(DictConstants.BIZ_MAJOR_CODE, d.getMajor());
                            device.setMajor(Integer.parseInt(major));
                            String f = getDictItemCode(DictConstants.BIZ_DATA_UPDATE_FREQUENCY_CODE, d.getUpdateFrequency());
                            device.setUpdateFrequency(Integer.parseInt(f));
                            device.setOrgId(dataDirectory.getOrgId());
                            device.setResponsible(d.getResponsible());
                            device.setDescription(d.getDeviceDesc());
                            i ++;
                        }
                        Point point = new Point();
                        point.setDeviceCode(deviceCode);
                        point.setDeviceName(device.getName());
                        point.setCode(d.getPointCode());
                        point.setName(d.getPointDesc());
                        points.add(point);
                    }
                    device.setPointCount(points.size());
                    device.setUpdateTime(LocalDateTime.now());
                    deviceService.saveOrUpdate(device);
                    // 保存点码
                    pointService.lambdaUpdate()
                            .eq(Point::getDeviceCode, device.getCode())
                            .remove();
                    pointService.saveBatch(points);
                });
            });
        });
    }

    /**
     * 获取数据目录为空则创建
     * @param name
     * @return
     */
    public DataDirectory getDataDirectory(String name){
        DataDirectory dataDirectory = dataDirectoryService.lambdaQuery()
                .eq(DataDirectory::getName, name)
                .one();
        if (dataDirectory == null) {
            dataDirectory = new DataDirectory();
            dataDirectory.setParentId(0L);
            dataDirectory.setName(name);
            dataDirectory.setCode(UUID.fastUUID().toString(true));
            dataDirectoryService.save(dataDirectory);
        }
        return dataDirectory;
    }

    /**
     * 获取设备为空则创建
     * @param name
     * @return
     */
    public Device getDevice(String name, DataDirectory dataDirectory){
        Device device = deviceService.lambdaQuery()
                .eq(Device::getName, name)
                .eq(Device::getDataDirectoryId, dataDirectory.getId())
                .one();
        if (device == null) {
            device = new Device();
            device.setDataDirectoryId(dataDirectory.getId());
            device.setDataDirectoryName(dataDirectory.getName());
            device.setOrgId(dataDirectory.getOrgId());
            device.setOrgName(dataDirectory.getOrgName());
            device.setName(name);
        }
        return device;
    }

    public String getDictItemCode(String dictCode, String value) {
        if (StrUtil.isBlank(value)) {
            Dict dic = dictService.lambdaQuery()
                    .eq(Dict::getCode, dictCode)
                    .one();
            throw new RuntimeException(StrUtil.format("{}不能为空", dic.getName()));
        }
        String dictItemCode = dictItemService.getCodeByDictCodeAndValue(dictCode, value);
        if (dictItemCode == null) {
            List<DictItem> dictItems = dictItemService.listByDictCode(dictCode);
            DictItem dictItem = dictItems.get(dictItems.size() - 1);
            String code = dictItem.getCode();
            int intCode = Integer.parseInt(code);
            DictItem di = new DictItem();
            di.setDictCode(dictCode);
            dictItemCode = String.valueOf(intCode);
            di.setCode(dictItemCode);
            di.setValue(value);
            di.setDescription(value);
            di.setSort(99);
            dictItemService.save(di);
        }
        return dictItemCode;
    }
}
