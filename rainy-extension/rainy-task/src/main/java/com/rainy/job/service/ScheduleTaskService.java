package com.rainy.job.service;


import com.rainy.job.entity.ScheduleTask;
import com.rainy.system.service.BaseService;

import java.util.Collection;
import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/27 18:17
 */
public interface ScheduleTaskService extends BaseService<ScheduleTask> {

    void addTask(ScheduleTask scheduleTask);
    void removeTask(Long id);

    boolean update(ScheduleTask scheduleTask);

    boolean removeByIds(List<Long> ids);

}
