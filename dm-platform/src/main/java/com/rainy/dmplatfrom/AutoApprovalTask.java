package com.rainy.dmplatfrom;

import cn.hutool.core.lang.UUID;
import com.rainy.dmplatfrom.entity.AccessToken;
import com.rainy.dmplatfrom.entity.UserDataRel;
import com.rainy.dmplatfrom.mapper.AccessTokenMapper;
import com.rainy.dmplatfrom.service.UserDataRelService;
import com.rainy.framework.constant.DictConstants;
import com.rainy.workflow.constant.VariableNames;
import lombok.RequiredArgsConstructor;
import org.camunda.bpm.engine.delegate.DelegateExecution;
import org.camunda.bpm.engine.delegate.JavaDelegate;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/23 16:47
 */
@Component
@RequiredArgsConstructor
public class AutoApprovalTask implements JavaDelegate {

    private final UserDataRelService userDataRelService;
    private final AccessTokenMapper accessTokenMapper;

    @Override
    public void execute(DelegateExecution execution) throws Exception {
        Map<String, Object> variables = execution.getVariables();
        Object applyUsername = variables.get(VariableNames.START_BY).toString();
        Object dataType = variables.get("dataType");
        Object dataId = variables.get("dataId");
        Object approved = variables.get("approved");
        if ((int) approved == DictConstants.APPROVE_STATUS_1) {
            AccessToken accessToken = new AccessToken();
            accessToken.setUserDataId((Long) dataId);
            accessToken.setAccessToken(UUID.fastUUID().toString(true));
        }
        userDataRelService.lambdaUpdate()
                .eq(UserDataRel::getApplyUsername, applyUsername)
                .eq(UserDataRel::getDataType, dataType)
                .eq(UserDataRel::getDataId, dataId)
                .set(UserDataRel::getApproved, approved)
                .set(UserDataRel::getApplyTime, LocalDateTime.now())
                .update();
    }

}
