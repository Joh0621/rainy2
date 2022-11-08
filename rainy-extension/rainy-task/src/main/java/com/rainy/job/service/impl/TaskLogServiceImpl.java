package com.rainy.job.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rainy.job.entity.TaskLog;
import com.rainy.job.mapper.TaskLogMapper;
import com.rainy.job.service.TaskLogService;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/11/7 11:28
 */
@Service
public class TaskLogServiceImpl extends ServiceImpl<TaskLogMapper, TaskLog> implements TaskLogService {

    @Async
    @Override
    public void asyncSave(TaskLog taskLog) {
        this.save(taskLog);
    }

    @Override
    public boolean clear() {
        return this.baseMapper.clear();
    }
}
