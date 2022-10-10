package com.rainy.base.config.security;

import cn.dev33.satoken.stp.StpInterface;
import cn.dev33.satoken.stp.StpUtil;
import com.rainy.base.service.MenuService;
import com.rainy.base.service.RoleMenuRelService;
import com.rainy.base.service.RoleService;
import com.rainy.base.service.UserRoleRelService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/29 13:26
 */
@Component
@RequiredArgsConstructor
public class StpInterfaceImpl implements StpInterface {

    private static final String PERMISSION_KEY = "permissions";
    private static final String ROLE_KEY = "roles";

    private final UserRoleRelService userRoleRelService;
    private final RoleMenuRelService roleMenuRelService;
    private final MenuService menuService;
    private final RoleService roleService;


    /**
     * 返回指定账号id所拥有的权限码集合
     *
     * @param loginId   账号id
     * @param loginType 账号类型
     * @return 该账号id具有的权限码集合
     */
    @Override
    public List<String> getPermissionList(Object loginId, String loginType) {
        // 缓存权限信息，更新权限信息时需要重新登录
        return StpUtil.getSessionByLoginId(StpUtil.getLoginId()).get(PERMISSION_KEY, () -> {
            // 1.查询拥有的角色
            List<Long> roleIds = userRoleRelService.listRoleIdsByUserId(loginId);
            if (roleIds.isEmpty()) {
                return List.of();
            }
            // 2.查询角色拥有的菜单id列表（按钮）
            List<Long> menuIds = roleMenuRelService.listMenuIdsInRoleId(roleIds);
            if (menuIds.isEmpty()) {
                return List.of();
            }
            // 3.查询菜单（按钮）权限码
            return menuService.listPermissionsInId(menuIds);
        });
    }

    /**
     * 返回指定账号id所拥有的角色标识集合
     *
     * @param loginId   账号id
     * @param loginType 账号类型
     * @return 该账号id具有的角色标识集合
     */
    @Override
    public List<String> getRoleList(Object loginId, String loginType) {
        // 缓存角色信息，更新角色信时是需要重新登录
        return StpUtil.getSessionByLoginId(StpUtil.getLoginId()).get(ROLE_KEY, () -> {
            // 1.查询拥有的角色
            List<Long> roleIds = userRoleRelService.listRoleIdsByUserId(loginId);
            if (roleIds.isEmpty()) {
                return List.of();
            }
            return roleService.listCodesInId(roleIds);
        });
    }
}
