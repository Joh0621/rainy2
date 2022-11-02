package com.rainy.dmplatfrom.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.dmplatfrom.entity.Device;
import com.rainy.dmplatfrom.entity.Point;
import com.rainy.dmplatfrom.entity.UserDataRel;
import com.rainy.dmplatfrom.param.ApplyParam;
import com.rainy.dmplatfrom.param.BatchApplyParam;
import com.rainy.dmplatfrom.service.DeviceService;
import com.rainy.dmplatfrom.service.PointService;
import com.rainy.dmplatfrom.service.UserDataRelService;
import com.rainy.framework.annotation.Log;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.common.Result;
import com.rainy.framework.constant.CharConstants;
import com.rainy.framework.constant.DictConstants;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.SecurityUtils;
import com.rainy.framework.utils.ValidateUtils;
import com.rainy.framework.utils.WebUtils;
import com.rainy.workflow.constant.VariableNames;
import com.rainy.workflow.service.WorkflowService;
import com.rainy.workflow.service.WorkflowTaskService;
import lombok.RequiredArgsConstructor;
import org.camunda.bpm.engine.runtime.ProcessInstance;
import org.camunda.bpm.engine.task.Task;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.*;

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
    private final PointService pointService;
    private final DeviceService deviceService;

    @Log(module = "数据申请", type = OpType.DEL, detail = "'申请了数据[' + #param.device.name + '].'")
    @PostMapping("/data/apply")
    public Result<Object> apply(@RequestBody ApplyParam param) {
        Device device = param.getDevice();
        // 1.检查是否申请过该数据
        Long userId = SecurityUtils.getUserId();
        boolean exists = userDataRelService.lambdaQuery()
                .eq(UserDataRel::getApplyUserId, userId)
                .eq(UserDataRel::getDataDirectionId, device.getDataDirectoryId())
                .eq(UserDataRel::getDataId, device.getId())
                .exists();
        ValidateUtils.isExists(exists, "您已经申请过该数据，请不要重复申请！");

        Map<String, Object> variables = new HashMap<>();
        variables.put(VariableNames.START_BY, SecurityUtils.getUsername());
        // 2.启动数据申请流程
        ProcessInstance processInstance = workflowService.startProcess(processDefinitionKey, variables);
        UserDataRel userDataRel = new UserDataRel();
        userDataRel.setDataId(device.getId().toString());
        userDataRel.setDataType(param.getDataType());
        userDataRel.setDataName(device.getName());
        userDataRel.setDataCode(device.getCode());
        userDataRel.setDataDirectionId(device.getDataDirectoryId());
        userDataRel.setDataDirectionName(device.getDataDirectoryName());
        userDataRel.setOrgId(device.getOrgId());
        userDataRel.setOrgName(device.getOrgName());
        userDataRel.setApplyTime(LocalDateTime.now());
        userDataRel.setApplyUserId(SecurityUtils.getUserId());
        userDataRel.setApplyUsername(SecurityUtils.getUsername());
        userDataRel.setApproved(DictConstants.APPROVE_STATUS_0);
        userDataRel.setProcessInstanceId(processInstance.getProcessInstanceId());
        userDataRel.setProcessDefinitionId(processInstance.getProcessDefinitionId());
        userDataRelService.save(userDataRel);

        // 3. 完成任务
        variables.put("dataType", param.getDataType());
        variables.put("dataId", param.getDevice().getId());
        // 是否申请本部门数据
        boolean flag = Objects.equals(device.getOrgId(), SecurityUtils.getUserinfo().getOrgId());
        variables.put(VariableNames.APPROVED, DictConstants.APPROVE_STATUS_1);
        variables.put("flag", flag);
        Task task = workflowTaskService.getTaskByProcessInstanceId(processInstance.getProcessInstanceId());
        workflowService.complete(task.getId(), variables, param.getRemarks());
        return Result.ok();
    }

    @Log(module = "数据申请", type = OpType.DEL, detail = "'批量申请了数据[' + #param.dataIds + '].'")
    @PostMapping("/data/apply/batch")
    public Result<Object> batchApply(@RequestBody BatchApplyParam param) {
        Map<String, Object> variables = new HashMap<>();
        variables.put(VariableNames.START_BY, SecurityUtils.getUsername());
        // 1.启动数据申请流程
        ProcessInstance processInstance = workflowService.startProcess(processDefinitionKey, variables);
        //
        List<String> dataIds = param.getDataIds();
        List<Device> list = deviceService.lambdaQuery()
                .in(Device::getId, dataIds)
                .list();
        StringBuilder dataName = new StringBuilder();
        StringBuilder dataCode = new StringBuilder();
        Set<String> dataDirectorNames = new HashSet<>();
        for (Device device : list) {
            dataName.append(device.getName()).append(CharConstants.COMMA);
            dataCode.append(device.getCode()).append(CharConstants.COMMA);
            dataDirectorNames.add(device.getDataDirectoryName());
        }

        UserDataRel userDataRel = new UserDataRel();
        String dataId = String.join(CharConstants.COMMA, param.getDataIds());
        userDataRel.setDataId(dataId);
        userDataRel.setDataType(param.getDataType());
        userDataRel.setDataName(dataName.toString());
        userDataRel.setDataCode(dataCode.toString());
//        userDataRel.setDataDirectionId(device.getDataDirectoryId());
        userDataRel.setDataDirectionName(StrUtil.join(CharConstants.COMMA, dataDirectorNames));
//        userDataRel.setOrgId(device.getOrgId());
//        userDataRel.setOrgName(device.getOrgName());
        userDataRel.setApplyTime(LocalDateTime.now());
        userDataRel.setApplyUserId(SecurityUtils.getUserId());
        userDataRel.setApplyUsername(SecurityUtils.getUsername());
        userDataRel.setApproved(DictConstants.APPROVE_STATUS_0);
        userDataRel.setProcessInstanceId(processInstance.getProcessInstanceId());
        userDataRel.setProcessDefinitionId(processInstance.getProcessDefinitionId());
        userDataRelService.save(userDataRel);
        // 3. 完成任务
        variables.put("dataType", param.getDataType());
        variables.put("dataId", dataId);
        // 是否申请本部门数据
        variables.put("flag", false);
        Task task = workflowTaskService.getTaskByProcessInstanceId(processInstance.getProcessInstanceId());
        workflowService.complete(task.getId(), variables, param.getRemarks());
        return Result.ok();
    }

    @GetMapping("/applies")
    public Page<UserDataRel> getApply(Page<UserDataRel> page) {
        return userDataRelService.lambdaQuery()
                .eq(UserDataRel::getApplyUserId, SecurityUtils.getUserId())
                .page(page);
    }

    @PostMapping("/apply/update")
    public boolean edit(@RequestBody UserDataRel userDataRel) {
        return userDataRelService.updateById(userDataRel);
    }

    @GetMapping("/data/point/download")
    @Log(module = "数据申请", type = OpType.DEL, detail = "'下载了设备[' + #param.name + ']测点点码.'")
    public void downloadPointCode(HttpServletResponse response, IdNamesParam param) throws IOException {
        UserDataRel userDataRel = userDataRelService.getById(param.getId());
        Integer dataType = userDataRel.getDataType();
        if (dataType == 0) {
            List<Point> list = pointService.lambdaQuery()
                    .eq(Point::getDeviceCode, userDataRel.getDataCode())
                    .list();
            String fileName = StrUtil.format("{}-{}.xls", userDataRel.getDataDirectionName(), userDataRel.getDataName());
            WebUtils.exportExcel(response, list, fileName);
        }
    }


    @PostMapping("/data/apply/cancel")
    @Log(module = "数据申请", type = OpType.DEL, detail = "'取消了申请[' + #param.name + '].'")
    public boolean apply(@RequestBody IdNamesParam param) {
        return userDataRelService.lambdaUpdate()
                .eq(UserDataRel::getId, param.getId())
                .remove();
    }

}
