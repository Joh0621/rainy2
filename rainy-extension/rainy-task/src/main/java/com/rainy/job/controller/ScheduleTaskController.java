package com.rainy.job.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import cn.hutool.cron.task.Task;
import cn.hutool.extra.spring.SpringUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.framework.annotation.Log;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.constant.CharConstants;
import com.rainy.framework.constant.DictConstants;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.WebUtils;
import com.rainy.framework.validation.Group;
import com.rainy.job.entity.ScheduleTask;
import com.rainy.job.service.ScheduleTaskService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/28 15:54
 */
@RestController
@RequiredArgsConstructor
public class ScheduleTaskController {

    private final ScheduleTaskService scheduleTaskService;

    @GetMapping("/tasks")
    @SaCheckPermission("task:query")
    @Log(module = "定时任务", type = OpType.QUERY, detail = "'查询了定时任务列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    public Page<ScheduleTask> list(Page<ScheduleTask> page, ScheduleTask param) {
        return scheduleTaskService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(param.getName()), ScheduleTask::getName, param.getName())
                .eq(param.getCategory() != null, ScheduleTask::getCategory, param.getCategory())
                .page(page);
    }

    @GetMapping("/task/classes")
    public List<String> listJobClasses() {
        Map<String, Task> beans = SpringUtil.getBeansOfType(Task.class);
        return beans.values().stream()
                .map(c -> c.getClass().getName())
                .toList();
    }

    @GetMapping("/tasks/export")
    @SaCheckPermission("task:export")
    @Log(module = "定时任务管理", type = OpType.EXPORT, detail = "导出了定时任务列表")
    public void export(HttpServletResponse response) throws IOException {
        List<ScheduleTask> scheduleTasks = scheduleTaskService.list();
        WebUtils.exportExcel(response, scheduleTasks, "jobs.xls");
    }

    @PostMapping("/task")
    @SaCheckPermission("task:add")
    @Log(module = "定时任务管理", type = OpType.ADD, detail = "'新增了定时任务[' + #param.name + '].'")
    public Boolean save(@RequestBody @Validated(Group.Add.class) ScheduleTask param) {
        return scheduleTaskService.save(param);
    }

    @PostMapping("/tasks")
    @SaCheckPermission("task:del")
    @Log(module = "定时任务管理", type = OpType.DEL, detail = "'删除了定时任务[' + #param.names + '].'")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return scheduleTaskService.removeByIds(param.getIds());
    }

    @PostMapping("/task/update")
    @SaCheckPermission("task:update")
    @Log(module = "定时任务管理", type = OpType.UPDATE, detail = "'更新了定时任务[' + #param.name + '].'")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) ScheduleTask param) {
        return scheduleTaskService.update(param);
    }

    @PostMapping("/task/execute")
    @SaCheckPermission("task:execute")
    @Log(module = "定时任务管理", type = OpType.ADD, detail = "'执行了定时任务[' + #param.name + '].'")
    public Boolean executeTask(@RequestBody @Validated ScheduleTask param) {
        String simpleName = StrUtil.subAfter(param.getClassName(), CharConstants.DOT, true);
        String beanName = StrUtil.lowerFirst(simpleName);
        Task task = SpringUtil.getBean(beanName, Task.class);
        task.execute();
        return Boolean.TRUE;
    }

    @PostMapping("/task/start")
    @SaCheckPermission("task:start")
    @Log(module = "定时任务管理", type = OpType.ADD, detail = "'暂停了定时任务[' + #param.name + '].'")
    public Boolean startTask(@RequestBody @Validated ScheduleTask param) {
        param.setStatus(DictConstants.TASK_STATUS_START);
        return scheduleTaskService.update(param);
    }

    @PostMapping("/task/stop")
    @SaCheckPermission("task:stop")
    @Log(module = "定时任务管理", type = OpType.ADD, detail = "'暂停了定时任务[' + #param.name + '].'")
    public Boolean stopTask(@RequestBody @Validated ScheduleTask param) {
        param.setStatus(DictConstants.TASK_STATUS_STOP);
        return scheduleTaskService.update(param);
    }

}
