package com.rainy.dmplatfrom.controller;

import cn.hutool.core.bean.BeanUtil;
import com.rainy.base.common.Result;
import com.rainy.base.common.ResultCode;
import com.rainy.base.common.utils.SaTokenUtils;
import com.rainy.dmplatfrom.entity.DataDirectory;
import com.rainy.dmplatfrom.entity.Device;
import com.rainy.dmplatfrom.entity.UserDataRel;
import com.rainy.dmplatfrom.service.DataDirectoryService;
import com.rainy.dmplatfrom.service.UserDataRelService;
import com.rainy.workflow.service.WorkflowService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;
import java.util.Objects;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/20 11:23
 */
@RestController
@RequiredArgsConstructor
public class DataApplyController {

    private final WorkflowService camundaService;
    private final UserDataRelService userDataRelService;
    private final DataDirectoryService dataDirectoryService;
    private static final String processDefinitionKey = "process-data-apply";

    @PostMapping("/data/apply")
    public Result<Object> apply(@RequestBody Device device) {
        // 1.检查是否申请过该数据
        Long userId = SaTokenUtils.getUserId();
        boolean exists = userDataRelService.lambdaQuery()
                .eq(UserDataRel::getUserId, userId)
                .eq(UserDataRel::getDataDirectionId, device.getDataDirectoryId())
                .eq(UserDataRel::getDataId, device.getId()).exists();
        if (exists) {
            return Result.of(ResultCode.BAD_REQUEST, "您已经申请过该数据，请不要重复申请！");
        }
        // 2.判断是否申请本部门数据
        DataDirectory dataDirectory = dataDirectoryService.getById(device.getDataDirectoryId());
        Map<String, Object> variables = BeanUtil.beanToMap(device);
        variables.put("flag", 1);
        if (Objects.equals(SaTokenUtils.getUserinfo().getOrgId(), dataDirectory.getOrgId())) {
            variables.put("flag", 0);
        }
        variables.put("startBy", SaTokenUtils.getUsername());
        // 3.启动数据申请流程
        camundaService.startProcess(processDefinitionKey, variables);
        return Result.ok();
    }

}
