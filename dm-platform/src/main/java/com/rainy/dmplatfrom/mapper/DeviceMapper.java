package com.rainy.dmplatfrom.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.rainy.dmplatfrom.entity.Device;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/20 11:22
 */
public interface DeviceMapper extends BaseMapper<Device> {

    @Select("select data_directory_name stationName, sum(point_count) pointCount from biz_device GROUP BY data_directory_name")
    List<Map<String, Object>> stationPointCount();

    @Select("select data_directory_name stationName, count(name) deviceCount from biz_device GROUP BY data_directory_name")
    List<Map<String, Object>> stationDeviceCount();
}
