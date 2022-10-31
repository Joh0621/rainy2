package com.rainy.dmplatfrom.api;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.hutool.json.JSON;
import cn.hutool.json.JSONUtil;
import com.rainy.dmplatfrom.entity.ApiRecord;
import com.rainy.dmplatfrom.entity.Interface;
import com.rainy.dmplatfrom.entity.PointData;
import com.rainy.dmplatfrom.service.ApiRecordService;
import com.rainy.dmplatfrom.service.AuthService;
import com.rainy.dmplatfrom.service.InterfaceService;
import com.rainy.framework.common.Result;
import com.rainy.framework.common.ResultCode;
import lombok.RequiredArgsConstructor;
import org.springframework.util.StopWatch;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 21:50
 */
@RestController
@RequiredArgsConstructor
public class PointApiController {

    private static final String REAL_TIME_API_CODE = "real_data";
    private static final String HISTORY_API_CODE = "history_data";

    private final InterfaceService interfaceService;
    private final AuthService authService;
    private final ApiRecordService apiRecordService;

    @SaIgnore
    @RequestMapping("/points/realTime")
    public Result<Object> listPoints(@Validated RealTimeParam param) {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        Interface anInterface = interfaceService.getByCode(REAL_TIME_API_CODE);
        if (anInterface.getStatus() == 1) {
            return Result.of(ResultCode.INTERNAL_SERVER_ERROR, "调用失败，接口已被停用!");
        }
        // 校验是否有点码权限
        authService.auth(param.getCodes());

        List<PointData> data = new ArrayList<>();
        for (String code : param.getCodes()) {
            PointData pointData = new PointData();
            pointData.setCode(code);
            pointData.setTime(LocalDateTime.now());
            pointData.setValue(new Random().nextDouble());
            data.add(pointData);
        }
        stopWatch.stop();
        // 保存调用记录
        long totalTimeMillis = stopWatch.getTotalTimeMillis();
        ApiRecord apiRecord = new ApiRecord();
        apiRecord.setApiCode(REAL_TIME_API_CODE);
        apiRecord.setResponseTime(totalTimeMillis);
        int length = JSONUtil.toJsonStr(data).getBytes(StandardCharsets.UTF_8).length;
        apiRecord.setDataSize((long) length);
        apiRecordService.asyncSave(apiRecord);
        return Result.ok(data);
    }

    @SaIgnore
    @RequestMapping("/points/history")
    public Result<Object> listPoints(@Validated HistoryParam param) {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        Interface anInterface = interfaceService.getByCode(HISTORY_API_CODE);
        if (anInterface.getStatus() == 1) {
            return Result.of(ResultCode.INTERNAL_SERVER_ERROR, "调用失败，接口已被停用");
        }
        // 校验是否有点码权限
        authService.auth(param.getCodes());

        List<PointData> data = new ArrayList<>();
        for (String code : param.getCodes()) {
            PointData pointData = new PointData();
            pointData.setCode(code);
            pointData.setTime(LocalDateTime.now());
            pointData.setValue(new Random().nextDouble());
            data.add(pointData);
        }

        stopWatch.stop();
        // 保存调用记录
        long totalTimeMillis = stopWatch.getTotalTimeMillis();
        ApiRecord apiRecord = new ApiRecord();
        apiRecord.setApiCode(HISTORY_API_CODE);
        apiRecord.setResponseTime(totalTimeMillis);
        int length = JSONUtil.toJsonStr(data).getBytes(StandardCharsets.UTF_8).length;
        apiRecord.setDataSize((long) length);
        apiRecordService.asyncSave(apiRecord);
        return Result.ok();
    }

}
