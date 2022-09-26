package com.rainy.workflow.service.impl;

import com.rainy.workflow.service.CamundaService;
import lombok.RequiredArgsConstructor;
import org.camunda.bpm.engine.HistoryService;
import org.camunda.bpm.engine.RepositoryService;
import org.camunda.bpm.engine.RuntimeService;
import org.camunda.bpm.engine.TaskService;
import org.camunda.bpm.engine.history.HistoricActivityInstance;
import org.camunda.bpm.engine.history.HistoricActivityInstanceQuery;
import org.camunda.bpm.engine.history.HistoricTaskInstance;
import org.camunda.bpm.engine.repository.Deployment;
import org.camunda.bpm.engine.repository.ProcessDefinition;
import org.camunda.bpm.engine.runtime.ProcessInstance;
import org.camunda.bpm.engine.task.Task;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/23 18:00
 */
@Service
@RequiredArgsConstructor
public class CamundaServiceImpl implements CamundaService {

    private final RuntimeService runtimeService;
    private final TaskService taskService;
    private final HistoryService historyService;
    private final RepositoryService repositoryService;

    @Override
    public void createProcessDefinition() {
        ProcessDefinition processDefinition = repositoryService.createProcessDefinitionQuery().singleResult();
        processDefinition.getDiagramResourceName();
    }

    @Override
    public Deployment deployProcess(String name) {
        return repositoryService.createDeployment()
                .tenantId("")
                .name(name)
                .deploy();
    }

    @Override
    public void deleteDeployment(String deploymentId) {
        repositoryService.deleteDeployment(deploymentId);
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
    public List<Task> listTasks(String assignee, int current, int size) {
        int firstResult = (current - 1) * size;
        return taskService.createTaskQuery()
                .taskAssignee(assignee)
                .listPage(firstResult, size);
    }

    @Override
    public List<HistoricTaskInstance> listHistoryTasks(String assignee, int current, int size) {
        taskService.createTaskQuery();
        HistoricActivityInstanceQuery historicActivityInstanceQuery = historyService.createHistoricActivityInstanceQuery();
        List<HistoricActivityInstance> list1 = historicActivityInstanceQuery.list();
        return null;
    }

    @Override
    public void approve(String taskId, Map<String, Object> variables) {
        taskService.complete(taskId, variables);
    }


}
