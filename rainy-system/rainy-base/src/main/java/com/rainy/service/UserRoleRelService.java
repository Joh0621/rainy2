package com.rainy.service;

import com.rainy.entity.UserRoleRel;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/19 17:53
 */
public interface UserRoleRelService extends BaseService<UserRoleRel> {

    List<Long> listRoleIdsByUserId(Long userId);

    Boolean assignRoles(Long userId, List<Long> roleIds);
}
