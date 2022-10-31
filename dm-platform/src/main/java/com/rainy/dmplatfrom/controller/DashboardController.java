package com.rainy.dmplatfrom.controller;

import com.rainy.dmplatfrom.entity.ApiRecordStatistics;
import com.rainy.dmplatfrom.entity.DataDirectory;
import com.rainy.dmplatfrom.entity.UserDataRel;
import com.rainy.dmplatfrom.service.*;
import com.rainy.framework.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import org.camunda.bpm.engine.TaskService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/24 17:55
 */
@RestController
@RequiredArgsConstructor
public class DashboardController {

    private static final String REAL_TIME_API_CODE = "real_data";

    private final DataDirectoryService dataDirectoryService;
    private final DeviceService deviceService;
    private final PointService pointService;
    private final UserDataRelService userDataRelService;
    private final TaskService taskService;
    private final ApiRecordService apiRecordService;

    @GetMapping("/dashboard/count")
    public List<Long> count(){
        long count = dataDirectoryService.lambdaQuery()
                .eq(DataDirectory::getIsDirectory, false)
                .count();
        long deviceCount = deviceService.count();
        long pointCount = pointService.count();
        Long applies = userDataRelService.lambdaQuery()
                .eq(UserDataRel::getApplyUserId, SecurityUtils.getUserId())
                .count();
        long todoCount = taskService.createTaskQuery()
                .taskAssignee(SecurityUtils.getUsername()).count();
        return Arrays.asList(count, deviceCount, pointCount, applies, todoCount);
    }

    @GetMapping("/dashboard/point/count")
    private List<Map<String, Object>> pointCount(int type){
        if (type == 0) {
            return deviceService.stationPointCount();
        }
        return deviceService.majorPointCount();
    }

    @GetMapping("/dashboard/device/count")
    private List<Map<String, Object>> deviceCount(int type){
        if (type == 0) {
            return deviceService.stationDeviceCount();
        }
        return deviceService.majorDeviceCount();
    }

    @GetMapping("/dashboard/api/statistics")
    private List<List<Map<String, Object>>> statistics(){
        Map<String, ApiRecordStatistics> res = apiRecordService.statistics();
        List<Map<String, Object>> apiCount = new ArrayList<>();
        List<Map<String, Object>> apiResponseTime = new ArrayList<>();
        List<Map<String, Object>> apiDataSize = new ArrayList<>();
        res.forEach((key, value) -> {
            Map<String, Object> countData = new HashMap<>();
            Map<String, Object> responseTimeData = new HashMap<>();
            Map<String, Object> dataSizeData = new HashMap<>();
            if (REAL_TIME_API_CODE.equals(key)) {
                countData.put("name", "实时数据接口");
                responseTimeData.put("name", "实时数据接口");
                dataSizeData.put("name", "实时数据接口");
            } else {
                countData.put("name", "历史数据接口");
                responseTimeData.put("name", "历史数据接口");
                dataSizeData.put("name", "历史数据接口");
            }
            countData.put("value", value.getTotalCount());
            responseTimeData.put("value", value.getAvgResponseTime());
            dataSizeData.put("value", value.getTotalDataSize());
            apiCount.add(countData);
            apiResponseTime.add(responseTimeData);
            apiDataSize.add(dataSizeData);
        });
        return Arrays.asList(apiCount, apiResponseTime, apiDataSize);
    }

}

