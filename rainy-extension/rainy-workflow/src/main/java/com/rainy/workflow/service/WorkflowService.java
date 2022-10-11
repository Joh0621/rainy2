package com.rainy.workflow.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.workflow.entity.ProcessDef;
import com.rainy.workflow.entity.WorkflowTask;
import org.camunda.bpm.engine.repository.Deployment;
import org.camunda.bpm.engine.runtime.ProcessInstance;

import java.io.InputStream;
import java.util.Map;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/23 17:59
 */
public interface WorkflowService {

    Page<ProcessDef> listProcessDefinitions(Page<ProcessDef> page, ProcessDef processDef);
    Deployment deployProcess(String resourceName, InputStream inputStream);
    String processDefinitionBpmn20xml(String processDefinitionId);
    InputStream getProcessDiagram(String processDefinitionId);
    ProcessInstance startProcess(String processDefinitionKey, Map<String, Object> variables);
    ProcessInstance startProcess(String processDefinitionKey, String businessKey, Map<String, Object> variables);

    Page<WorkflowTask> listTasks(String assignee, String processName, String startBy, Page<WorkflowTask> page);
    Page<WorkflowTask> listHistoryTasks(String assignee, String startBy, Boolean finished, Page<WorkflowTask> page);
    void complete(String taskId, Map<String, Object> variables);

}
