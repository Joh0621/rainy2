package com.rainy.base.service;

import com.rainy.base.entity.RoleMenuRel;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/28 0028 22:59
 */
public interface RoleMenuRelService extends BaseService<RoleMenuRel> {

    List<Long> listMenuIdsInRoleId(List<Long> roleIds);
}
