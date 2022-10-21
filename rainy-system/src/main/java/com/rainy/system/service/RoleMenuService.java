package com.rainy.system.service;

import com.rainy.system.entity.RoleMenu;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/28 0028 22:59
 */
public interface RoleMenuService extends BaseService<RoleMenu> {

    List<Long> listMenuIdsInRoleId(List<Long> roleIds);
}
