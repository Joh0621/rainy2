package com.rainy.system.service;

import com.rainy.system.entity.Role;
import com.rainy.system.entity.RoleMenu;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/13 0013 22:02
 */
public interface RoleService extends BaseService<Role> {

    Boolean assignMenus(Long id, List<RoleMenu> roleMenuList);

    List<String> listRolesInId(List<Long> roleIds);

    Long getIdByCode(String code);
}
