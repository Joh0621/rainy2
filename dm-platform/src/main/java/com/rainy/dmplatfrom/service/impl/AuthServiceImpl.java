package com.rainy.dmplatfrom.service.impl;

import cn.dev33.satoken.spring.SpringMVCUtil;
import cn.hutool.core.util.StrUtil;
import com.rainy.dmplatfrom.entity.AccessToken;
import com.rainy.dmplatfrom.entity.Point;
import com.rainy.dmplatfrom.entity.UserDataRel;
import com.rainy.dmplatfrom.service.AccessTokenService;
import com.rainy.dmplatfrom.service.AuthService;
import com.rainy.dmplatfrom.service.PointService;
import com.rainy.dmplatfrom.service.UserDataRelService;
import com.rainy.framework.exception.UnauthorizedException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 22:15
 */
@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {

    private final AccessTokenService accessTokenService;
    private final UserDataRelService userDataRelService;
    private final PointService pointService;

    @Override
    public void auth(List<String> codes) {
        String token = SpringMVCUtil.getRequest().getHeader("token");
        if (token == null) {
            token = SpringMVCUtil.getRequest().getParameter("token");
        }
        AccessToken accessToken = accessTokenService.lambdaQuery()
                .eq(AccessToken::getAccessToken, token)
                .one();
        if (accessToken == null) {
            throw new UnauthorizedException(StrUtil.format("token[] 无效", token));
        }
        Long userDataId = accessToken.getUserDataId();
        UserDataRel userDataRel = userDataRelService.getById(userDataId);
        List<Point> points = pointService.lambdaQuery()
                .eq(Point::getDeviceCode, userDataRel.getDataCode())
                .list();
        Set<String> authCodes = points.stream()
                .map(Point::getCode)
                .collect(Collectors.toSet());
        for (String code : codes) {
            if (!authCodes.contains(code)) {
                throw new UnauthorizedException(StrUtil.format("您没有点码[{}]的权限！", code));
            }
        }
    }

}
