package com.rainy.job;

import cn.hutool.cron.task.Task;
import com.rainy.job.entity.TaskLog;
import org.springframework.stereotype.Component;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/28 16:50
 */
@Component
public class SampleJob implements Task {

    @Override
    public void execute() {
        System.out.println("打印一句话。");
    }

}
