package com.rainy.job.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.rainy.job.entity.TaskLog;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/11/7 11:27
 */
public interface TaskLogService extends IService<TaskLog> {

    void asyncSave(TaskLog taskLog);

    boolean clear();
}
