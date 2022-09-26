package com.rainy.base.service.impl;

import com.rainy.base.entity.UserRoleRel;
import com.rainy.base.mapper.UserRoleRelMapper;
import com.rainy.base.service.UserRoleRelService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/19 17:53
 */
@Service
public class UserRoleRelServiceImpl extends BaseServiceImpl<UserRoleRelMapper, UserRoleRel> implements UserRoleRelService {

    /**
     * 根据用户id查询角色id列表
     *
     * @param userId 用户id
     * @return {@link List}<{@link Long}>
     */
    @Override
    public List<Long> listRoleIdsByUserId(Long userId) {
        List<UserRoleRel> userRoleRelList = this.lambdaQuery()
                .eq(UserRoleRel::getUserId, userId)
                .list();
        return userRoleRelList.stream()
                .map(UserRoleRel::getRoleId)
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
                .eq(UserRoleRel::getUserId, userId)
                .remove();
        // 2.给用户分配角色
        List<UserRoleRel> userRoleRels = roleIds.stream()
                .map(roleId -> new UserRoleRel(userId, roleId))
                .toList();
        return this.saveBatch(userRoleRels);
    }

}
