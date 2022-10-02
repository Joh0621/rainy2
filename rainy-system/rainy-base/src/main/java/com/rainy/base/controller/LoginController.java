package com.rainy.base.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.stp.SaTokenInfo;
import cn.dev33.satoken.stp.StpUtil;
import com.rainy.base.common.Result;
import com.rainy.base.common.ResultCode;
import com.rainy.base.common.utils.SaTokenUtils;
import com.rainy.base.entity.Menu;
import com.rainy.base.param.LoginParam;
import com.rainy.base.entity.User;
import com.rainy.base.service.MenuService;
import com.rainy.base.service.RoleMenuRelService;
import com.rainy.base.service.UserRoleRelService;
import com.rainy.base.service.UserService;
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
 * data-middle-platform
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
    public Result<Object> login(@RequestBody LoginParam param) {
        User user = userService.lambdaQuery()
                .eq(User::getUsername, param.getUsername())
                .one();
        if (user == null || !Objects.equals(param.getPassword(), user.getPassword())) {
            return Result.of(ResultCode.ACCOUNT_PASSWORD_NOT_MATCH);
        }
        // 登录
        StpUtil.login(user.getId());
        // 缓存用户信息
        SaTokenUtils.setUserinfo(user);
        SaTokenInfo tokenInfo = StpUtil.getTokenInfo();
        return Result.of(tokenInfo);
    }

    @GetMapping("/userinfo")
    public Map<String, Object> userinfo() {
        Map<String, Object> userinfo = new HashMap<>();
        userinfo.put("userinfo", SaTokenUtils.getUserinfo());
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
