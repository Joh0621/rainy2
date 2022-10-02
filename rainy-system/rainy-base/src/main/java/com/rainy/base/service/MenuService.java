package com.rainy.base.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.rainy.base.entity.Menu;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author @author Created by renguangli at 2022/9/1 17:40
 */
public interface MenuService extends IService<Menu> {

    List<Menu> tree(Menu menu);
    List<Menu> treeInMenuId(List<Long> menuIds);
    List<String> listPermissionsInId(List<Long> menuIds);

    String getName(String permission);

}
