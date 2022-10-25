package com.rainy.system.service;

import com.rainy.system.entity.User;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/14 0014 6:36
 */
public interface UserService extends BaseService<User> {

    boolean save(User user);

    List<String> listRoles(Long userId);
    List<String> listPermissions(Long userId);

    void cacheUserinfo();
}
