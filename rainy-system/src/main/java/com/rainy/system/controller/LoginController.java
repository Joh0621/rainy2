package com.rainy.system.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.rainy.framework.common.Result;
import com.rainy.framework.common.ResultCode;
import com.rainy.framework.common.Userinfo;
import com.rainy.framework.exception.UnauthorizedException;
import com.rainy.framework.utils.SecurityUtils;
import com.rainy.system.entity.Menu;
import com.rainy.system.entity.Org;
import com.rainy.system.entity.User;
import com.rainy.system.param.LoginParam;
import com.rainy.system.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/29 10:53
 */
@RestController
@RequiredArgsConstructor
public class LoginController {

    private final UserService userService;
    private final OrgService orgService;
    private final MenuService menuService;

    @SaIgnore
    @PostMapping("/login")
    public SaTokenInfo login(@RequestBody LoginParam param) {
        User user = userService.lambdaQuery()
                .eq(User::getUsername, param.getUsername())
                .one();
        // 校验账号密码是否正确
        if (user == null || !Objects.equals(param.getPassword(), user.getPassword())) {
            throw new UnauthorizedException(ResultCode.ACCOUNT_PASSWORD_NOT_MATCH);
        }
        // 检查账号是否被封禁
        StpUtil.checkDisable(user.getId());
        // 登录
        StpUtil.login(user.getId(), param.getRememberMe() != null && param.getRememberMe());

        // 缓存用户信息
        userService.cacheUserinfo();
        // 返回 token
        return StpUtil.getTokenInfo();
    }

    @SaIgnore
    @PostMapping("/logout")
    public Result<Object> logout() {
        StpUtil.logout();
        return Result.ok();
    }

    @GetMapping("/userinfo")
    public Userinfo userinfo() {
        Userinfo userinfo = SecurityUtils.getUserinfo();
        List<Menu> menus = menuService.treeByUserId(SecurityUtils.getUserId());
        userinfo.setMenus(menus);
        return userinfo;
    }

}
