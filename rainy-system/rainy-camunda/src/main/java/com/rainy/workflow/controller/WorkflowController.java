package com.rainy.workflow.controller;

import com.rainy.base.common.Result;
import com.rainy.base.common.utils.SaTokenUtils;
import com.rainy.workflow.entity.ApproveParam;
import com.rainy.workflow.entity.WorkflowTask;
import com.rainy.workflow.service.WorkflowService;
import lombok.RequiredArgsConstructor;
import org.camunda.bpm.engine.RepositoryService;
import org.camunda.bpm.engine.RuntimeService;
import org.camunda.bpm.engine.TaskService;
import org.camunda.bpm.engine.history.HistoricTaskInstance;
import org.camunda.bpm.engine.runtime.ProcessInstance;
import org.camunda.bpm.engine.task.Task;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/15 10:24
 */
@RestController
@RequestMapping("/workflow")
@RequiredArgsConstructor
public class CamundaController {

    private final WorkflowService camundaService;
    private final RepositoryService repositoryService;
    private final TaskService taskService;

    String processKey = "process-data-apply";
    String businessKey = "data-apply";

    @GetMapping("/process/start")
    public Result<Object> start() {
        Map<String, Object> variables = new HashMap<>();
        variables.put("flag", 0);
        ProcessInstance processInstance = camundaService.startProcess(processKey, businessKey, variables);
        return Result.ok(("流程启动成功"));
    }

    @GetMapping("/tasks/history")
    public List<HistoricTaskInstance> historyTasks() {
        List<Map<String, Object>> tasks = new ArrayList<>();

        List<HistoricTaskInstance> historicTaskInstances = camundaService.listHistoryTasks("", 1, 1);
        for (HistoricTaskInstance instance : historicTaskInstances) {
            Map<String, Object> task = new HashMap<>();
            task.put("name", instance.getName());
            task.put("assignee", instance.getAssignee());
            task.put("startTime", instance.getStartTime());
            task.put("endTime", instance.getEndTime());
        }
        return historicTaskInstances;
    }

    @GetMapping("/tasks")
    public List<WorkflowTask>  tasks(HttpServletResponse response) throws IOException {
        List<Task> list = camundaService.listTasks(SaTokenUtils.getUsername(), 1, 10);
        List<WorkflowTask> tasks = new ArrayList<>();
        for (Task task : list) {
            WorkflowTask workflowTask = new WorkflowTask();
            workflowTask.setId(task.getId());
            workflowTask.setName(task.getName());
            workflowTask.setCreateTime(task.getCreateTime());
            String name = repositoryService.getProcessDefinition(task.getProcessDefinitionId()).getName();
            workflowTask.setProcessName(name);
            Map<String, Object> variables = taskService.getVariables(task.getId());
            workflowTask.setVariables(variables);
            tasks.add(workflowTask);
        }
        return tasks;
    }

    @GetMapping("/task/approve")
    public Result<String> approve(ApproveParam param) {
        Map<String, Object> variables = new HashMap<>();
        variables.put("approved", param.getApproved());
        variables.put("remarks", param.getRemarks());
        camundaService.approve(param.getTaskId(), variables);
        return Result.ok();
    }

}
