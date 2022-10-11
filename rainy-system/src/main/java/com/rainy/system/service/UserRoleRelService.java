package com.rainy.system.service;

import com.rainy.system.entity.UserRoleRel;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/19 17:53
 */
public interface UserRoleRelService extends BaseService<UserRoleRel> {

    List<Long> listRoleIdsByUserId(Object userId);

    Boolean assignRoles(Long userId, List<Long> roleIds);
}
