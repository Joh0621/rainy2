package com.rainy.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.rainy.system.entity.Menu;

import java.util.List;

/**
 * rainy
 *
 * @author @author Created by renguangli at 2022/9/1 17:40
 */
public interface MenuService extends IService<Menu> {

    List<Menu> tree(Menu menu);
    List<Menu> treeInMenuId(List<Long> menuIds);
    List<String> listPermissionsInId(List<Long> menuIds);

    String getName(String permission);

}
