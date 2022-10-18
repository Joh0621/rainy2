package com.rainy.workflow.service.impl;

import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.framework.constant.CharConstants;
import com.rainy.workflow.constant.VariableNames;
import com.rainy.workflow.entity.Activity;
import com.rainy.workflow.entity.ProcessDef;
import com.rainy.workflow.entity.WorkflowTask;
import com.rainy.workflow.service.WorkflowService;
import lombok.RequiredArgsConstructor;
import org.camunda.bpm.engine.*;
import org.camunda.bpm.engine.history.HistoricActivityInstance;
import org.camunda.bpm.engine.history.HistoricTaskInstance;
import org.camunda.bpm.engine.history.HistoricTaskInstanceQuery;
import org.camunda.bpm.engine.history.HistoricVariableInstance;
import org.camunda.bpm.engine.repository.Deployment;
import org.camunda.bpm.engine.repository.ProcessDefinition;
import org.camunda.bpm.engine.repository.ProcessDefinitionQuery;
import org.camunda.bpm.engine.runtime.ProcessInstance;
import org.camunda.bpm.engine.task.Comment;
import org.camunda.bpm.engine.task.Task;
import org.camunda.bpm.engine.task.TaskQuery;
import org.camunda.bpm.model.bpmn.BpmnModelInstance;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.*;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/23 18:00
 */
@Service
@RequiredArgsConstructor
public class WorkflowServiceImpl implements WorkflowService {

    private final RuntimeService runtimeService;
    private final TaskService taskService;
    private final HistoryService historyService;
    private final RepositoryService repositoryService;

    @Override
    public Page<ProcessDef> listProcessDefinitions(Page<ProcessDef> page, ProcessDef processDef) {
        // 1. 分页查询流程定义
        long firstResult = (page.getCurrent() - 1) * page.getSize();
        ProcessDefinitionQuery query = repositoryService.createProcessDefinitionQuery();
        if (StrUtil.isNotBlank(processDef.getCategory())) {
            query.processDefinitionCategory(processDef.getCategory());
        }
        if (StrUtil.isNotBlank(processDef.getName())) {
            query.processDefinitionNameLike(processDef.getName());
        }
        List<ProcessDefinition> list = query.latestVersion()
                .listPage((int) firstResult, (int) page.getSize());

        List<ProcessDef> processDefs = list.stream().map(p -> {
            ProcessDef def = new ProcessDef();
            def.setId(p.getId());
            def.setName(p.getName());
            def.setKey(p.getKey());
            def.setCategory(p.getCategory());
            def.setDescription(p.getDescription());
            return def;
        }).toList();
        // 2.查询总数量
        long count = taskService.createTaskQuery().count();
        page.setRecords(processDefs);
        page.setTotal(count);
        return page;
    }

    @Override
    public Deployment deployProcess(String resourceName, InputStream inputStream) {
        return repositoryService.createDeployment()
                .tenantId(CharConstants.EMPTY)
                .addInputStream(resourceName, inputStream)
                .deploy();
    }

    @Override
    public String processDefinitionBpmn20xml(String processDefinitionId) {
        InputStream processModelIn = repositoryService.getProcessModel(processDefinitionId);
        return IoUtil.read(processModelIn, StandardCharsets.UTF_8);
    }

    @Override
    public InputStream getProcessDiagram(String processDefinitionId) {
        InputStream processDiagram = repositoryService.getProcessDiagram(processDefinitionId);
        if (processDiagram == null) {
            return null;
        }
        return repositoryService.getProcessDiagram(processDefinitionId);
    }

    @Override
    public Map<String, Object> getVariablesByTaskId(String taskId) {

        return null;
    }

    @Override
    public ProcessInstance startProcess(String processDefinitionKey, Map<String, Object> variables) {
        return runtimeService.startProcessInstanceByKey(processDefinitionKey, variables);
    }

    @Override
    public ProcessInstance startProcess(String processDefinitionKey, String businessKey, Map<String, Object> variables) {
        return runtimeService.startProcessInstanceByKey(processDefinitionKey, businessKey, variables);
    }

    @Override
    public Page<WorkflowTask> listTasks(String assignee, String processName, String startBy, Page<WorkflowTask> page) {
        long firstResult = (page.getCurrent() - 1) * page.getSize();
        // 1.查询我的待办
        TaskQuery taskQuery = taskService.createTaskQuery();
        if (StrUtil.isNotBlank(processName)) {
            taskQuery.processDefinitionNameLike(processName);
        }
        if (StrUtil.isNotBlank(startBy)) {
            taskQuery.processVariableValueLike(VariableNames.START_BY, startBy);
        }
        List<Task> tasks = taskQuery
                .taskAssignee(assignee)
                .orderByTaskCreateTime().desc()
                .listPage((int) firstResult, (int) page.getSize());
        // 2.封装为 WorkflowTask
        List<WorkflowTask> workflowTasks = tasks.stream().map(task -> {
            WorkflowTask workflowTask = new WorkflowTask();
            workflowTask.setId(task.getId());
            workflowTask.setProcessInstanceId(task.getProcessInstanceId());
            workflowTask.setName(task.getName());
            workflowTask.setStartTime(task.getCreateTime());
            workflowTask.setDueDate(task.getDueDate());
            workflowTask.setAssignee(task.getAssignee());
            String name = repositoryService.getProcessDefinition(task.getProcessDefinitionId()).getName();
            workflowTask.setProcessName(name);

            Map<String, Object> variables = taskService.getVariables(task.getId());
            workflowTask.setStartBy((String) variables.get(VariableNames.START_BY));
            workflowTask.setVariables(variables);
            return workflowTask;
        }).toList();
        // 3.查询总数量
        long count = taskService.createTaskQuery().count();
        page.setRecords(workflowTasks);
        page.setTotal(count);
        return page;
    }

    @Override
    public Page<WorkflowTask> listHistoryTasks(String assignee, String startBy, Boolean finished, Page<WorkflowTask> page) {
        long firstResult = (page.getCurrent() - 1) * page.getSize();
        HistoricTaskInstanceQuery query = historyService.createHistoricTaskInstanceQuery();
        if (StrUtil.isNotBlank(assignee)) {
            query.taskAssignee(assignee);
        }
        if (StrUtil.isNotBlank(startBy)) {
            query.processVariableValueLike(VariableNames.START_BY, startBy);
        }
        if (finished != null && finished) {
            query.finished();
        }
        List<HistoricTaskInstance> historyTasks = query
                .orderByHistoricTaskInstanceEndTime().desc()
                .listPage((int) firstResult, (int) page.getSize());

        List<WorkflowTask> workflowTasks = historyTasks.stream().map(task -> {
            WorkflowTask workflowTask = new WorkflowTask();
            workflowTask.setId(task.getId());
            workflowTask.setProcessDefinitionId(task.getProcessDefinitionId());
            workflowTask.setProcessInstanceId(task.getProcessInstanceId());
            workflowTask.setName(task.getName());
            workflowTask.setStartTime(task.getStartTime());
            workflowTask.setEndTime(task.getEndTime());
            if (task.getEndTime() != null) {
                workflowTask.setFinished(true);
            }
            workflowTask.setDurationInMillis(task.getDurationInMillis());
            workflowTask.setDueDate(task.getDueDate());
            String name = repositoryService.getProcessDefinition(task.getProcessDefinitionId()).getName();
            workflowTask.setProcessName(name);
            workflowTask.setAssignee(task.getAssignee());

            List<HistoricVariableInstance> list = historyService.createHistoricVariableInstanceQuery()
                    .processInstanceId(task.getProcessInstanceId())
                    .list();
            Map<String, Object> variables = new LinkedHashMap<>();
            list.forEach(v -> {
                variables.put(v.getName(), v.getValue());
            });
            workflowTask.setStartBy(variables.get(VariableNames.START_BY).toString());
            workflowTask.setVariables(variables);
            return workflowTask;
        }).toList();
        // 3.查询总数量
        long count = historyService.createHistoricTaskInstanceQuery().count();
        page.setRecords(workflowTasks);
        page.setTotal(count);
        return page;
    }

    @Override
    public void complete(String taskId, Map<String, Object> variables) {
        taskService.complete(taskId, variables);
    }

    @Override
    public void complete(String taskId, Map<String, Object> variables, String... comments) {
        Task task = taskService.createTaskQuery()
                .taskId(taskId)
                .singleResult();
        for (String comment : comments) {
            taskService.createComment(taskId, task.getProcessInstanceId(), comment);
        }
        taskService.complete(taskId, variables);
    }

    @Override
    public List<Activity> listActivities(String processInstanceId) {
        List<HistoricActivityInstance> activityInstances = historyService.createHistoricActivityInstanceQuery()
                .processInstanceId(processInstanceId)
                .orderByHistoricActivityInstanceEndTime().asc()
                .list();
        return activityInstances.stream()
                .filter(active -> ActivityTypes.TASK_USER_TASK.equals(active.getActivityType())
                        || ActivityTypes.END_EVENT_NONE.equals(active.getActivityType()))
                .map(active -> {
                    Activity act = new Activity();
                    act.setName(active.getActivityName());
                    act.setAssignee(active.getAssignee());
                    act.setStartTime(active.getStartTime());
                    act.setEndTime(active.getEndTime());
                    List<Comment> taskComments = taskService.getTaskComments(active.getTaskId());
                    for (Comment comment : taskComments) {
                        act.setRemarks(comment.getFullMessage());
                    }
                    if (active.getActivityType().equals(ActivityTypes.END_EVENT_NONE)) {
                        act.setRemarks("结束");
                    }
                    return act;
                }).toList();
    }

}
