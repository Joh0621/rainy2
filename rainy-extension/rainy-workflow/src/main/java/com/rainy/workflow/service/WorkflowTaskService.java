package com.rainy.workflow.service;

import org.camunda.bpm.engine.task.Task;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/23 17:59
 */
public interface WorkflowTaskService {

    Task getTaskByProcessInstanceId(String processInstanceId);

}
