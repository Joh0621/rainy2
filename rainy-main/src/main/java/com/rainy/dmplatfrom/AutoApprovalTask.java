package com.rainy.workflow;

import cn.hutool.core.bean.BeanUtil;
import com.rainy.common.utils.SaTokenUtils;
import org.camunda.bpm.engine.delegate.DelegateExecution;
import org.camunda.bpm.engine.delegate.JavaDelegate;

import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/23 16:47
 */
public class AutoApprovalTask implements JavaDelegate {

    @Override
    public void execute(DelegateExecution execution) throws Exception {
        Map<String, Object> variables = execution.getVariables();
        Long userId = SaTokenUtils.getUserId();
        Long orgId = (Long)variables.get("orgId");
        Long dataDirectoryId = (Long)variables.get("dataDirectoryId");
        variables.forEach((key, value) -> {
            System.out.println(key + ":" + value);
        });
        System.out.println("===============");
    }

}
