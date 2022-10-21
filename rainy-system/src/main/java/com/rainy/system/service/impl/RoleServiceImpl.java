package com.rainy.system.service.impl;

import com.rainy.system.entity.Role;
import com.rainy.system.entity.RoleMenu;
import com.rainy.system.mapper.RoleMapper;
import com.rainy.system.service.RoleMenuService;
import com.rainy.system.service.RoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/13 22:03
 */
@Service
@RequiredArgsConstructor
public class RoleServiceImpl extends BaseServiceImpl<RoleMapper, Role> implements RoleService {

    private final RoleMenuService roleMenuService;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean assignMenus(Long roleId, List<RoleMenu> roleMenuList) {
        roleMenuService.lambdaUpdate()
                .eq(RoleMenu::getRoleId, roleId)
                .remove();
        return roleMenuService.saveBatch(roleMenuList);
    }

    @Override
    public List<String> listRolesInId(List<Long> roleIds) {
        List<Role> roles = this.lambdaQuery()
                .select(Role::getCode)
                .in(Role::getId, roleIds)
                .list();
        return roles.stream()
                .map(Role::getCode)
                .toList();
    }

    @Override
    public Long getIdByCode(String code) {
        Role role = this.lambdaQuery()
                .eq(Role::getCode, code).one();
        return role == null ? 0 : role.getId();
    }

}
