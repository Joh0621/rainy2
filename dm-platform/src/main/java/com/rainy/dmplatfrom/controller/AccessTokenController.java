package com.rainy.dmplatfrom.controller;

import cn.hutool.core.lang.UUID;
import com.rainy.dmplatfrom.entity.AccessToken;
import com.rainy.dmplatfrom.service.AccessTokenService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/24 12:10
 */
@RestController
@RequiredArgsConstructor
public class AccessTokenController {

    private final AccessTokenService accessTokenService;

    @GetMapping("/accessToken")
    public AccessToken get(AccessToken accessToken) {
        return accessTokenService.lambdaQuery()
                .eq(AccessToken::getUserDataId, accessToken.getUserDataId())
                .one();
    }

    @PostMapping("/accessToken/update")
    public Boolean update(@RequestBody AccessToken accessToken) {
        AccessToken token = new AccessToken();
        token.setAccessToken(UUID.randomUUID().toString());
        return accessTokenService.lambdaUpdate().
                eq(AccessToken::getUserDataId, accessToken.getUserDataId())
                .update(token);
    }

}
