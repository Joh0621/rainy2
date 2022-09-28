package com.rainy.dmplatfrom;

import com.rainy.base.common.utils.SaTokenUtils;
import com.rainy.dmplatfrom.entity.UserDataRel;
import com.rainy.dmplatfrom.service.UserDataRelService;
import lombok.RequiredArgsConstructor;
import org.camunda.bpm.engine.delegate.DelegateExecution;
import org.camunda.bpm.engine.delegate.JavaDelegate;
import org.springframework.stereotype.Component;

import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/23 16:47
 */
@Component
@RequiredArgsConstructor
public class AutoApprovalTask implements JavaDelegate {

    private final UserDataRelService userDataRelService;

    @Override
    public void execute(DelegateExecution execution) throws Exception {
        Map<String, Object> variables = execution.getVariables();
        Long userId = SaTokenUtils.getUserId();
        Long orgId = (Long)variables.get("orgId");
        Long dataDirectoryId = (Long)variables.get("dataDirectoryId");
        Long dataId = (Long)variables.get("id");
        UserDataRel userDataRel = new UserDataRel(userId, orgId, dataDirectoryId, dataId);
        userDataRelService.save(userDataRel);
        System.out.println("===============");
        variables.forEach((key, value) -> {
            System.out.println(key + ":" + value);
        });
    }

}
