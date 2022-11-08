package com.rainy.job.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.framework.annotation.Log;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.WebUtils;
import com.rainy.job.entity.TaskLog;
import com.rainy.job.service.TaskLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/11/7 11:28
 */
@RestController
@RequiredArgsConstructor

public class TaskLogController {
    private final TaskLogService taskLogService;


    @Log(module = "定时任务", type = OpType.QUERY, detail = "'查询了定时任务执行日志列表第' + #page.current + '页.每页' + #page.size + '条数据'", resSaved = false)
    @GetMapping("/taskLogs")
    public Page<TaskLog> pageTaskLogs(Page<TaskLog> page, TaskLog taskLog,
                               @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm") LocalDateTime startTime,
                               @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm") LocalDateTime endTime) {
        return taskLogService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(taskLog.getName()), TaskLog::getName, taskLog.getName())
                .eq(StrUtil.isNotBlank(taskLog.getCategory()), TaskLog::getCategory, taskLog.getCategory())
                .eq(taskLog.getSuccess() != null, TaskLog::getSuccess, taskLog.getSuccess())
                .between(!Objects.isNull(startTime) && !Objects.isNull(endTime), TaskLog::getDatetime, startTime, endTime)
                .page(page);
    }

    @Log(module = "定时任务", type = OpType.EXPORT, detail = "导出了定时任务执行日志列表", resSaved = false, paramSaved = false)
    @GetMapping("/taskLogs/export")
    public void export(HttpServletResponse response) throws IOException {
        List<TaskLog> taskLogs = taskLogService.list();
        WebUtils.exportExcel(response, taskLogs, "taskLogs.xls");
    }

    @Log(module = "定时任务", type = OpType.DEL, detail = "'删除了定时任务执行日志[' + #ids + '].'")
    @DeleteMapping("/taskLogs")
    public Boolean batchRemoveTaskLog(@RequestBody List<Integer> ids) {
        return taskLogService.removeBatchByIds(ids);
    }

    @Log(module = "定时任务执行日志", type = OpType.DEL, detail = "清空了定时任务执行日志")
    @DeleteMapping("/taskLogs/clear")
    public Boolean clearTaskLog() {
        return taskLogService.clear();
    }

}
