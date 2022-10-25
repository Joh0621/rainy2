package com.rainy.system.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import com.rainy.framework.common.Userinfo;
import com.rainy.framework.constant.DictConstants;
import com.rainy.framework.enums.DefaultRole;
import com.rainy.framework.utils.SecurityUtils;
import com.rainy.system.entity.Menu;
import com.rainy.system.entity.Org;
import com.rainy.system.entity.User;
import com.rainy.system.entity.UserRole;
import com.rainy.system.mapper.UserMapper;
import com.rainy.system.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

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
    private final OrgService orgService;

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
        // 超级管理员角色查询所有权限
        List<Long> menuIds = null;
        if (!StpUtil.getRoleList().contains(DefaultRole.SUPPER_ADMIN.getCode())) {
            // 1.查询拥有的角色
            List<Long> roleIds = userRoleService.listRoleIdsByUserId(userId);
            if (roleIds.isEmpty()) {
                return List.of();
            }
            // 2.查询角色拥有的菜单id列表（按钮）
            menuIds = roleMenuService.listMenuIdsInRoleId(roleIds);
            if (menuIds.isEmpty()) {
                return List.of();
            }
        }
        // 3.查询菜单（按钮）权限码
        List<Menu> list = menuService.lambdaQuery()
                .select(Menu::getPermission)
                .eq(Menu::getType, DictConstants.MENU_TYPE_BUTTON_CODE)
                .in(menuIds != null, Menu::getId, menuIds)
                .list();
        return list.stream()
                .filter(Objects::nonNull)
                .map(Menu::getPermission)
                .toList();
    }

    @Override
    public void cacheUserinfo() {
        User user = this.getById(SecurityUtils.getUserId());
        Userinfo userinfo = user.userinfo();
        SecurityUtils.setUserinfo(userinfo);

        Org org = orgService.getById(userinfo.getOrgId());
        List<Long> orgIds = orgService.getChildrenIds(org.getId());
        userinfo.setOrgIds(orgIds);
        userinfo.setOrg(org.getName());
        SecurityUtils.setUserinfo(userinfo);

        userinfo.setRoles(this.listRoles(user.getId()));
        SecurityUtils.setUserinfo(userinfo);

        userinfo.setPermissions(this.listPermissions(user.getId()));
        SecurityUtils.setUserinfo(userinfo);
    }

}
