package com.rainy.system.service.impl;

import com.rainy.framework.enums.DefaultRole;
import com.rainy.system.entity.User;
import com.rainy.system.entity.UserRole;
import com.rainy.system.mapper.UserMapper;
import com.rainy.system.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/14 6:36
 */
@Service
@RequiredArgsConstructor
public class UserServiceImpl extends BaseServiceImpl<UserMapper, User> implements UserService {

    private final RoleService roleService;
    private final MenuService menuService;
    private final RoleMenuService roleMenuService;
    private final UserRoleService userRoleService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean save(User user) {
        // 1.新增用户
        super.save(user);
        // 2.添加默认角色
        Long roleId = roleService.getIdByCode(DefaultRole.DEFAULT.getCode());
        return userRoleService.save(new UserRole(user.getId(), roleId));
    }

    @Override
    public List<String> listRoles(Long userId) {
        // 1.查询拥有的角色
        List<Long> roleIds = userRoleService.listRoleIdsByUserId(userId);
        if (roleIds.isEmpty()) {
            return List.of();
        }
        return roleService.listRolesInId(roleIds);
    }

    @Override
    public List<String> listPermissions(Long userId) {
        // 1.查询拥有的角色
        List<Long> roleIds = userRoleService.listRoleIdsByUserId(userId);
        if (roleIds.isEmpty()) {
            return List.of();
        }
        // 2.查询角色拥有的菜单id列表（按钮）
        List<Long> menuIds = roleMenuService.listMenuIdsInRoleId(roleIds);
        if (menuIds.isEmpty()) {
            return List.of();
        }
        // 3.查询菜单（按钮）权限码
        return menuService.listPermissionsInId(menuIds);
    }
}
