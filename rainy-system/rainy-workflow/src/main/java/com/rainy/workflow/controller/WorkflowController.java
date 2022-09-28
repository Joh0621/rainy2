package com.rainy.workflow.controller;

import cn.hutool.core.io.IoUtil;
import cn.hutool.core.io.file.FileNameUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.base.common.Result;
import com.rainy.base.common.utils.SaTokenUtils;
import com.rainy.workflow.entity.ProcessDef;
import com.rainy.workflow.param.ApproveParam;
import com.rainy.workflow.entity.WorkflowTask;
import com.rainy.workflow.service.WorkflowService;
import lombok.RequiredArgsConstructor;
import org.camunda.bpm.engine.RepositoryService;
import org.camunda.bpm.engine.TaskService;
import org.camunda.bpm.engine.repository.Deployment;
import org.camunda.bpm.engine.repository.ProcessDefinition;
import org.camunda.bpm.engine.runtime.ProcessInstance;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
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
public class WorkflowController {

    private final WorkflowService workflowService;
    private final RepositoryService repositoryService;
    private final TaskService taskService;

    String processKey = "process-data-apply";
    String businessKey = "data-apply";

    @GetMapping("/processDefs")
    public Page<ProcessDef> listProcesses(Page<ProcessDef> page, ProcessDef processDef) {
        return workflowService.listProcessDefinitions(page, processDef);
    }

    @GetMapping("/process/deploy")
    public Result<Object> deployProcess(@RequestParam(name = "file") MultipartFile file) throws IOException {
        String name = FileNameUtil.getName(file.getOriginalFilename());
        workflowService.deployProcess(name, file.getInputStream());
        return Result.ok();
    }

    @GetMapping("/process/bpmn20xml")
    public Result<String> getProcessBpmn20xml(HttpServletResponse response, String processDefinitionId) {
        String bpmn20xml = workflowService.processDefinitionBpmn20xml(processDefinitionId);
        return Result.ok(bpmn20xml);
    }

    @GetMapping("/process/diagram")
    public void getProcessDiagram(HttpServletResponse response, String processDefinitionId) {
        try (InputStream processDiagram = workflowService.getProcessDiagram(processDefinitionId)) {
            if (processDiagram != null) {
                byte[] bytes = IoUtil.readBytes(processDiagram);
                response.getOutputStream().write(bytes);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @GetMapping("/process/start")
    public Result<Object> startProcess() {
        Map<String, Object> variables = new HashMap<>();
        variables.put("flag", 0);
        return Result.ok(workflowService.startProcess(processKey, businessKey, variables));
    }

    @GetMapping("/tasks")
    public Page<WorkflowTask> listTasks(Page<WorkflowTask> page, String processName,String startBy) {
        return workflowService.listTasks(SaTokenUtils.getUsername(), processName, startBy, page);
    }

    @GetMapping("/historyTasks")
    public Page<WorkflowTask> listHistoryTasks(Page<WorkflowTask> page, String startBy, Boolean finished) {
        return workflowService.listHistoryTasks(SaTokenUtils.getUsername(), startBy, finished, page);
    }

    @PostMapping("/task/complete")
    public Result<String> complete(@RequestBody ApproveParam param) {
        Map<String, Object> variables = new HashMap<>();
        variables.put("approved", param.getApproved());
        variables.put("remarks", param.getRemarks());
        workflowService.complete(param.getTaskId(), variables);
        return Result.ok();
    }

}
