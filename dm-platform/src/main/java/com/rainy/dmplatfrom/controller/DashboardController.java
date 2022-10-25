package com.rainy.dmplatfrom.controller;

import com.rainy.dmplatfrom.entity.DataDirectory;
import com.rainy.dmplatfrom.service.DataDirectoryService;
import com.rainy.dmplatfrom.service.DeviceService;
import com.rainy.dmplatfrom.service.PointService;
import lombok.RequiredArgsConstructor;
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

    @GetMapping("/dashboard/count")
    public List<Long> count(){
        long count = dataDirectoryService.lambdaQuery()
                .eq(DataDirectory::getIsDirectory, false)
                .count();
        long deviceCount = deviceService.count();
        long pointCount = pointService.count();
        return Arrays.asList(count, deviceCount, pointCount);
    }
}

