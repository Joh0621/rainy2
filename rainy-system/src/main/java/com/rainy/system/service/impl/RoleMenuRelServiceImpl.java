package com.rainy.system.service.impl;

import com.rainy.system.entity.RoleMenuRel;
import com.rainy.system.mapper.RoleMenuRelMapper;
import com.rainy.system.service.RoleMenuRelService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/28 0028 22:59
 */
@Service
public class RoleMenuRelServiceImpl extends BaseServiceImpl<RoleMenuRelMapper, RoleMenuRel> implements RoleMenuRelService {

    /**
     * 查询角色拥有的菜单id列表（按钮）
     *
     * @param roleIds 角色id
     * @return {@link List}<{@link Long}>
     */
    @Override
    public List<Long> listMenuIdsInRoleId(List<Long> roleIds) {
        List<RoleMenuRel> menuRelList = this.lambdaQuery()
                .select(RoleMenuRel::getMenuId)
                .in(RoleMenuRel::getRoleId, roleIds)
                .list();
       return menuRelList.stream()
                .map(RoleMenuRel::getMenuId)
                .toList();
    }
}
