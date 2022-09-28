package com.rainy.base.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rainy.base.entity.Menu;
import com.rainy.base.mapper.MenuMapper;
import com.rainy.base.service.MenuService;
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
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

    @Override
    public List<Menu> tree(Menu menu) {
        List<Menu> menus = this.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(menu.getName()), Menu::getName, menu.getName())
                .list();
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
