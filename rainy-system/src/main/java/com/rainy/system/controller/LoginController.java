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
import com.rainy.system.entity.User;
import com.rainy.system.param.LoginParam;
import com.rainy.system.service.MenuService;
import com.rainy.system.service.RoleMenuRelService;
import com.rainy.system.service.UserRoleRelService;
import com.rainy.system.service.UserService;
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
    private final UserRoleRelService userRoleRelService;
    private final RoleMenuRelService roleMenuRelService;
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
        Userinfo userinfo = user.userinfo();
        userinfo.setRoles(userService.listRoles(user.getId()));
        userinfo.setPermissions(userService.listPermission(user.getId()));
        SecurityUtils.setUserinfo(userinfo);
        // 返回 token
        return StpUtil.getTokenInfo();
    }

    @GetMapping("/userinfo")
    public Map<String, Object> userinfo() {
        Map<String, Object> userinfo = new HashMap<>();
        userinfo.put("userinfo", SecurityUtils.getUserinfo());
        userinfo.put("permissions", StpUtil.getPermissionList());
        List<Long> roleIds = userRoleRelService.listRoleIdsByUserId(StpUtil.getLoginId());
        List<Long> menuIds = roleMenuRelService.listMenuIdsInRoleId(roleIds);
        List<Menu> menus = menuService.treeInMenuId(menuIds);
        userinfo.put("menus", menus);
        return userinfo;
    }

    @SaIgnore
    @PostMapping("/logout")
    public Result<Object> logout() {
        StpUtil.logout();
        return Result.ok();
    }
}
