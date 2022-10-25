package com.rainy.dmplatfrom.controller;

import com.rainy.dmplatfrom.entity.DataDirectory;
import com.rainy.dmplatfrom.entity.UserDataRel;
import com.rainy.dmplatfrom.service.DataDirectoryService;
import com.rainy.dmplatfrom.service.DeviceService;
import com.rainy.dmplatfrom.service.PointService;
import com.rainy.dmplatfrom.service.UserDataRelService;
import com.rainy.framework.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import org.camunda.bpm.engine.TaskService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/24 17:55
 */
@RestController
@RequiredArgsConstructor
public class DashboardController {

    private final DataDirectoryService dataDirectoryService;
    private final DeviceService deviceService;
    private final PointService pointService;
    private final UserDataRelService userDataRelService;
    private final TaskService taskService;

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

    @GetMapping("/dashboard/station/point/count")
    private List<Map<String, Object>> stationPointCount(){
        return deviceService.stationPointCount();
    }

    @GetMapping("/dashboard/station/device/count")
    private List<Map<String, Object>> stationDeviceCount(){
        return deviceService.stationDeviceCount();
    }
}

