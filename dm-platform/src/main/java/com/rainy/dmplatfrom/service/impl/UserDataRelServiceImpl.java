package com.rainy.dmplatfrom.service.impl;

import com.rainy.dmplatfrom.entity.AccessToken;
import com.rainy.dmplatfrom.entity.UserDataRel;
import com.rainy.dmplatfrom.mapper.UserDataRelMapper;
import com.rainy.dmplatfrom.service.AccessTokenService;
import com.rainy.dmplatfrom.service.UserDataRelService;
import com.rainy.system.service.impl.BaseServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/26 16:56
 */
@Service
@RequiredArgsConstructor
public class UserDataRelServiceImpl extends BaseServiceImpl<UserDataRelMapper, UserDataRel> implements UserDataRelService {

    private final AccessTokenService accessTokenService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean cancelApply(Long userDataId) {
        // 1.删除 accessToken
        accessTokenService.lambdaUpdate()
                .eq(AccessToken::getUserDataId, userDataId);
        // 2.删除用户设备关系（取消申请）
        return this.lambdaUpdate()
                .eq(UserDataRel::getId, userDataId)
                .remove();
    }
}
