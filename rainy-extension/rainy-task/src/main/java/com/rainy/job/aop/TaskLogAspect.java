package com.rainy.job.aop;

import cn.hutool.core.bean.BeanUtil;
import com.rainy.framework.utils.ThrowableUtils;
import com.rainy.job.entity.ScheduleTask;
import com.rainy.job.entity.TaskLog;
import com.rainy.job.service.ScheduleTaskService;
import com.rainy.job.service.TaskLogService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import java.time.LocalDateTime;

/**
 * 记录定时任务执行日志
 *
 * @author renguangli
 * @date 2022/3/14 16:36
 */
@Aspect
@Component
@Slf4j
@RequiredArgsConstructor
public class TaskLogAspect {

    private final ScheduleTaskService scheduleTaskService;
    private final TaskLogService taskLogService;

    /**
     * 定时任务执行日志
     */
    @Around("execution(public * cn.hutool.cron.task.Task.execute(..))")
    public Object saveTaskLog(ProceedingJoinPoint pjp) {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        TaskLog taskLog = buildTaskLog(pjp);
        Object result = null;
        try {
            result = pjp.proceed(pjp.getArgs());
            taskLog.setSuccess(true);
        } catch (Throwable e) {
            log.error("定时任务[{}]执行失败：{}", taskLog.getName(), e.getMessage(), e);
            taskLog.setSuccess(false);
            taskLog.setErrorMessage(ThrowableUtils.toString(e));
        } finally {
            stopWatch.stop();
            taskLog.setProcessTime(stopWatch.getTotalTimeMillis());
            taskLogService.asyncSave(taskLog);
        }
        return result;
    }

    private TaskLog buildTaskLog(ProceedingJoinPoint pjp) {
        String className = pjp.getTarget().getClass().getName();
        ScheduleTask task = scheduleTaskService.lambdaQuery()
                .eq(ScheduleTask::getClassName, className)
                .one();
        TaskLog taskLog = new TaskLog();
        taskLog.setClassName(className);
        BeanUtil.copyProperties(task, taskLog);
        taskLog.setDatetime(LocalDateTime.now());
        return taskLog;
    }

}
