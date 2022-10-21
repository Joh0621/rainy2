package com.rainy.system.service.impl;

import com.rainy.system.entity.RoleMenu;
import com.rainy.system.mapper.RoleMenuRelMapper;
import com.rainy.system.service.RoleMenuService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/28 0028 22:59
 */
@Service
public class RoleMenuServiceImpl extends BaseServiceImpl<RoleMenuRelMapper, RoleMenu> implements RoleMenuService {

    /**
     * 查询角色拥有的菜单id列表（按钮）
     *
     * @param roleIds 角色id
     * @return {@link List}<{@link Long}>
     */
    @Override
    public List<Long> listMenuIdsInRoleId(List<Long> roleIds) {
        List<RoleMenu> menuRelList = this.lambdaQuery()
                .select(RoleMenu::getMenuId)
                .in(RoleMenu::getRoleId, roleIds)
                .list();
       return menuRelList.stream()
                .map(RoleMenu::getMenuId)
                .toList();
    }
}
