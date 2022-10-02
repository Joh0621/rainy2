package com.rainy.base.service;

import com.rainy.base.entity.Role;
import com.rainy.base.entity.RoleMenuRel;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/13 0013 22:02
 */
public interface RoleService extends BaseService<Role> {

    Boolean assignMenus(Long id, List<RoleMenuRel> roleMenuRelList);

    List<String> listCodesInId(List<Long> roleIds);

    Long getIdByCode(String code);
}
