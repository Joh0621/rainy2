package com.rainy.job.service.impl;

import cn.hutool.core.util.StrUtil;
import cn.hutool.cron.CronUtil;
import cn.hutool.cron.task.Task;
import cn.hutool.extra.spring.SpringUtil;
import com.rainy.framework.constant.CharConstants;
import com.rainy.job.entity.ScheduleTask;
import com.rainy.job.mapper.ScheduleTaskMapper;
import com.rainy.job.service.ScheduleTaskService;
import com.rainy.system.service.impl.BaseServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/28 15:26
 */
@Service
@RequiredArgsConstructor
public class ScheduleTaskServiceImpl extends BaseServiceImpl<ScheduleTaskMapper, ScheduleTask> implements ScheduleTaskService {

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean save(ScheduleTask scheduleTask) {
        super.save(scheduleTask);
        this.addTask(scheduleTask);
        return false;
    }

    public void addTask(ScheduleTask scheduleTask) {
        if (scheduleTask.getStatus() == 1) {
            return;
        }
        String simpleName = StrUtil.subAfter(scheduleTask.getClassName(), CharConstants.DOT, true);
        String beanName = StrUtil.lowerFirst(simpleName);
        Task task = SpringUtil.getBean(beanName, Task.class);
        CronUtil.schedule(scheduleTask.getId().toString(), scheduleTask.getCron(), task);
    }

    @Override
    public void removeTask(Long id) {
        Task task = CronUtil.getScheduler().getTask(id.toString());
        if (task != null) {
            CronUtil.remove(id.toString());
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean update(ScheduleTask scheduleTask) {
        boolean result = this.updateById(scheduleTask);
        this.removeTask(scheduleTask.getId());
        this.addTask(scheduleTask);
        return result;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean removeByIds(List<Long> ids) {
        ids.forEach(this::removeTask);
        return super.removeByIds(ids);
    }

}
