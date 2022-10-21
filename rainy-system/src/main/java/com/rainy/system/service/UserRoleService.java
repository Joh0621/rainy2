package com.rainy.system.service;

import com.rainy.system.entity.UserRole;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/19 17:53
 */
public interface UserRoleService extends BaseService<UserRole> {

    List<Long> listRoleIdsByUserId(Object userId);

    Boolean assignRoles(Long userId, List<Long> roleIds);
}
