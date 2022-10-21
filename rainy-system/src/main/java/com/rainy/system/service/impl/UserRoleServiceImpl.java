package com.rainy.system.service.impl;

import com.rainy.system.entity.UserRole;
import com.rainy.system.mapper.UserRoleRelMapper;
import com.rainy.system.service.UserRoleService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/19 17:53
 */
@Service
public class UserRoleServiceImpl extends BaseServiceImpl<UserRoleRelMapper, UserRole> implements UserRoleService {

    /**
     * 根据用户id查询角色id列表
     *
     * @param userId 用户id
     * @return {@link List}<{@link Long}>
     */
    @Override
    public List<Long> listRoleIdsByUserId(Object userId) {
        List<UserRole> userRoleList = this.lambdaQuery()
                .eq(UserRole::getUserId, userId)
                .list();
        return userRoleList.stream()
                .map(UserRole::getRoleId)
                .toList();
    }

    /**
     * 给用户分配角色
     *
     * @param userId  用户id
     * @param roleIds 角色id列表
     * @return {@link Boolean}
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean assignRoles(Long userId, List<Long> roleIds) {
        // 1.先删除之前的关系
        this.lambdaUpdate()
                .eq(UserRole::getUserId, userId)
                .remove();
        // 2.给用户分配角色
        List<UserRole> userRoles = roleIds.stream()
                .map(roleId -> new UserRole(userId, roleId))
                .toList();
        return this.saveBatch(userRoles);
    }

}
