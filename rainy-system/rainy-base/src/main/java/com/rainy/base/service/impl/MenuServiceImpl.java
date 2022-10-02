package com.rainy.base.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.injector.methods.UpdateById;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rainy.base.common.constant.DictConstants;
import com.rainy.base.entity.Menu;
import com.rainy.base.mapper.MenuMapper;
import com.rainy.base.service.MenuService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;
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
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

    @Override
    public List<Menu> tree(Menu menu) {
        List<Menu> menus = this.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(menu.getName()), Menu::getName, menu.getName())
                .list();
        return this.tree(menus);
    }

    @Override
    public List<Menu> treeInMenuId(List<Long> menuIds) {
        List<Menu> menus = this.lambdaQuery()
                .in(Menu::getType, DictConstants.MENU_TYPE_DIRECTORY_CODE, DictConstants.MENU_TYPE_MENU_CODE)
                .in(menuIds != null, Menu::getId, menuIds)
                .list();
        return this.tree(menus);
    }

    @Override
    public List<String> listPermissionsInId(List<Long> menuIds) {
        List<Menu> list = this.lambdaQuery()
                .select(Menu::getPermission)
                .eq(Menu::getType, DictConstants.MENU_TYPE_BUTTON_CODE)
                .in(Menu::getId, menuIds)
                .list();
        return list.stream()
                .filter(ObjectUtil::isNotNull)
                .map(Menu::getPermission)
                .toList();
    }

    @Override
//    @CacheEvict(key = "#menu.permission")
    public boolean updateById(Menu menu) {
        return super.updateById(menu);
    }

    @Override
//    @Cacheable(key = "#permission")
    public String getName(String permission) {
        Menu menu = this.lambdaQuery()
                .select(Menu::getName)
                .eq(Menu::getPermission, permission)
                .one();
        return menu == null ? permission : menu.getName();
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
