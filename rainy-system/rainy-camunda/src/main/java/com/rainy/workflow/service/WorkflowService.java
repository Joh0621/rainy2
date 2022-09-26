package com.rainy.workflow.service;

import org.camunda.bpm.engine.history.HistoricTaskInstance;
import org.camunda.bpm.engine.repository.Deployment;
import org.camunda.bpm.engine.runtime.ProcessInstance;
import org.camunda.bpm.engine.task.Task;

import java.util.List;
import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/23 17:59
 */
public interface CamundaService {

    void createProcessDefinition();
    Deployment deployProcess(String name);
    void deleteDeployment(String deploymentId);
    ProcessInstance startProcess(String processDefinitionKey, Map<String, Object> variables);
    ProcessInstance startProcess(String processDefinitionKey, String businessKey, Map<String, Object> variables);

    List<Task> listTasks(String assignee, int current, int size);
    List<HistoricTaskInstance> listHistoryTasks(String assignee, int current, int size);

    void approve(String taskId, Map<String, Object> variables);

}
