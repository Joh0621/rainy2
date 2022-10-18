package com.rainy.dmplatfrom.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.dmplatfrom.entity.DataDirectory;
import com.rainy.dmplatfrom.entity.Device;
import com.rainy.dmplatfrom.entity.UserDataRel;
import com.rainy.dmplatfrom.service.DataDirectoryService;
import com.rainy.dmplatfrom.service.UserDataRelService;
import com.rainy.framework.common.Result;
import com.rainy.framework.utils.SecurityUtils;
import com.rainy.framework.utils.ValidateUtils;
import com.rainy.workflow.constant.VariableNames;
import com.rainy.workflow.service.WorkflowService;
import com.rainy.workflow.service.WorkflowTaskService;
import lombok.RequiredArgsConstructor;
import org.camunda.bpm.engine.TaskService;
import org.camunda.bpm.engine.runtime.ProcessInstance;
import org.camunda.bpm.engine.task.Task;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;
import java.util.Objects;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/20 11:23
 */
@RestController
@RequiredArgsConstructor
public class DataApplyController {

    private static final String processDefinitionKey = "process-data-apply";

    private final WorkflowService workflowService;
    private final WorkflowTaskService workflowTaskService;
    private final UserDataRelService userDataRelService;
    private final DataDirectoryService dataDirectoryService;

    @PostMapping("/data/apply")
    public Result<Object> apply(@RequestBody Device device) {
        // 1.检查是否申请过该数据
        Long userId = SecurityUtils.getUserId();
        boolean exists = userDataRelService.lambdaQuery()
                .eq(UserDataRel::getUserId, userId)
                .eq(UserDataRel::getDataDirectionId, device.getDataDirectoryId())
                .eq(UserDataRel::getDataId, device.getId()).exists();
        ValidateUtils.isExists(exists, "您已经申请过该数据，请不要重复申请！");

        Map<String, Object> variables = BeanUtil.beanToMap(device);
        variables.put(VariableNames.START_BY, SecurityUtils.getUsername());
        // 2.启动数据申请流程
        ProcessInstance processInstance = workflowService.startProcess(processDefinitionKey, variables);

        // 3.判断是否申请本部门数据
        DataDirectory dataDirectory = dataDirectoryService.getById(device.getDataDirectoryId());
        variables.put("flag", 1);
        if (Objects.equals(SecurityUtils.getUserinfo().getOrgId(), dataDirectory.getOrgId())) {
            variables.put("flag", 0);
        }
        variables.putAll(BeanUtil.beanToMap(device));

        Task task = workflowTaskService.getTaskByProcessInstanceId(processInstance.getProcessInstanceId());

        workflowService.complete(task.getId(), variables, "跑模型");
        return Result.ok();
    }

    @GetMapping("/applies")
    public Page<UserDataRel> getApply(Page<UserDataRel> page) {
        return userDataRelService.lambdaQuery()
                .eq(UserDataRel::getUserId, SecurityUtils.getUserId())
                .page(page);
    }

}
