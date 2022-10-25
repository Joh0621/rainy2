package com.rainy.system.service.impl;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rainy.framework.constant.DictConstants;
import com.rainy.framework.enums.DefaultRole;
import com.rainy.framework.utils.SecurityUtils;
import com.rainy.system.entity.Menu;
import com.rainy.system.mapper.MenuMapper;
import com.rainy.system.service.MenuService;
import com.rainy.system.service.RoleMenuService;
import com.rainy.system.service.UserRoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 * rainy
 *
 * @author renguangli
 * @date 2022/9/1 17:41
 */
@Service
@CacheConfig(cacheNames = "rainy:menu")
@RequiredArgsConstructor
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

    private final UserRoleService userRoleService;
    private final RoleMenuService roleMenuService;

    @Override
    public List<Menu> tree(Menu menu) {
        List<Menu> menus = this.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(menu.getName()), Menu::getName, menu.getName())
                .list();
        return this.tree(menus);
    }

    @Override
    public List<Menu> treeByUserId(Long userId) {
        List<Long> menuIds = null;
        // 超级管理员查询所有按钮权限
        if (!StpUtil.getRoleList().contains(DefaultRole.SUPPER_ADMIN.getCode())) {
            List<Long> roleIds = userRoleService.listRoleIdsByUserId(userId);
            menuIds = roleMenuService.listMenuIdsInRoleId(roleIds);
        }
        List<Menu> menus = this.lambdaQuery()
                .in(Menu::getType, DictConstants.MENU_TYPE_DIRECTORY_CODE, DictConstants.MENU_TYPE_MENU_CODE)
                .in(menuIds != null, Menu::getId, menuIds)
                .list();
        return this.tree(menus);
    }

    @Override
    public boolean updateById(Menu menu) {
        return super.updateById(menu);
    }

    private List<Menu> tree(List<Menu> menus) {
        // 1.找出父节点
        List<Menu> parents = menus.stream()
                .filter(m -> m.getParentId() == 0)
                .toList();
        // 2.为父节点设置子节点
        parents.forEach(parent -> parent.setChildren(getChildren(parent.getId(), menus)));
        return parents;
    }

    /**
     * 获取子节点列表
     */
    private List<Menu> getChildren(Long id, List<Menu> menus) {
        // 1.找出子节点
        List<Menu> children = menus.stream()
                .filter(Menu -> Objects.equals(id, Menu.getParentId()))
                .toList();
        // 2.为子节点设置子节点
        children.forEach(menu -> menu.setChildren(getChildren(menu.getId(), menus)));
        return children.isEmpty() ? null : children;
    }

}
