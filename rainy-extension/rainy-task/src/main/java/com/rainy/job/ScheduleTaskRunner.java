package com.rainy.job;

import cn.hutool.core.util.StrUtil;
import cn.hutool.cron.CronUtil;
import cn.hutool.cron.task.Task;
import cn.hutool.extra.spring.SpringUtil;
import com.rainy.framework.constant.CharConstants;
import com.rainy.job.entity.ScheduleTask;
import com.rainy.job.service.ScheduleTaskService;
import com.rainy.job.service.impl.ScheduleTaskServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/28 15:20
 */
@Component
@RequiredArgsConstructor
public class ScheduleTaskRunner implements ApplicationRunner {

    private final ScheduleTaskService scheduleTaskService;

    @Override
    public void run(ApplicationArguments args) throws Exception {
        CronUtil.start();
        CronUtil.setMatchSecond(true);
        // 添加定时任务
        List<ScheduleTask> scheduleTasks = scheduleTaskService.list();
        scheduleTasks.forEach(scheduleTaskService::addTask);
    }

}
