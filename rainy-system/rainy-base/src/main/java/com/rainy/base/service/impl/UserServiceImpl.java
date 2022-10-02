package com.rainy.base.service.impl;

import com.rainy.base.common.enums.DefaultRole;
import com.rainy.base.entity.User;
import com.rainy.base.entity.UserRoleRel;
import com.rainy.base.mapper.UserMapper;
import com.rainy.base.service.RoleService;
import com.rainy.base.service.UserRoleRelService;
import com.rainy.base.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/14 6:36
 */
@Service
@RequiredArgsConstructor
public class UserServiceImpl extends BaseServiceImpl<UserMapper, User> implements UserService {

    private final RoleService roleService;
    private final UserRoleRelService userRoleRelService;


    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean save(User user) {
        // 1.新增用户
        super.save(user);
        // 2.添加默认角色
        Long roleId = roleService.getIdByCode(DefaultRole.DEFAULT.getCode());
        return userRoleRelService.save(new UserRoleRel(user.getId(), roleId));
    }
}
