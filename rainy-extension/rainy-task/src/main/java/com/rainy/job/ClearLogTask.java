package com.rainy.job;

import cn.hutool.cron.task.Task;
import com.rainy.framework.constant.ConfigConstants;
import com.rainy.system.entity.LoginLog;
import com.rainy.system.entity.OperationLog;
import com.rainy.system.service.ConfigService;
import com.rainy.system.service.LoginLogService;
import com.rainy.system.service.OperationLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 23:18
 */
@Component
@RequiredArgsConstructor
public class ClearLogTask implements Task {

    private final ConfigService configService;
    private final LoginLogService loginLogService;
    private final OperationLogService operationLogService;

    @Override
    public void execute() {
        int days = configService.getAsInt(ConfigConstants.SYS_LOG_RETENTION_DAYS);
        LocalDateTime dateTime = LocalDateTime.now().minusDays(days);
        // 删除登录日志
        loginLogService.lambdaUpdate()
                .lt(LoginLog::getDatetime, dateTime)
                .remove();
        // 删除操作日志
        operationLogService.lambdaUpdate()
                .lt(OperationLog::getDatetime, dateTime)
                .remove();
    }

}
