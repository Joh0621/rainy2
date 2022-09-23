package com.rainy.service.impl;

import cn.hutool.core.util.StrUtil;
import com.rainy.entity.Org;
import com.rainy.mapper.OrgMapper;
import com.rainy.service.OrgService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/13 0013 22:15
 */
@Service
public class OrgServiceImpl extends BaseServiceImpl<OrgMapper, Org> implements OrgService {

    @Override
    public List<Org> tree() {
        List<Org> dataDirectories = this.list();
        // 1.找出父节点
        List<Org> parents = dataDirectories.stream()
                .filter(Org -> Org.getParentId() == 0)
                .toList();
        // 2.为父节点设置子节点
        parents.forEach(parent -> {
            parent.setChildren(getChildren(parent.getId(), dataDirectories));
        });
        return parents;
    }


    /**
     * 获取节点下的所有子节点列表
     *
     * @param org org
     * @return {@link List}<{@link Org}>
     */
    @Override
    public List<Org> list(Org org) {
        List<Org> orgs = new ArrayList<>();
        Org one = this.getById(org.getId());
        if (one == null) {
            return orgs;
        }
        // 1.添加当前节点
        orgs.add(one);
        // 2.找出当前节点下的所有子节点
        List<Org> orgList = this.lambdaQuery().
                likeRight(StrUtil.isNotBlank(org.getName()), Org::getName, org.getName()).
                likeRight(StrUtil.isNotBlank(org.getCode()), Org::getCode, org.getCode()).
                list();
        List<Org> listById = listById(org.getId(), orgList);
        // 3.添加所有子节点
        orgs.addAll(listById);
        return orgs;
    }

    /**
     * 获取子节点列表
     *
     * @param id   id
     * @param orgs 组织
     * @return {@link List}<{@link Org}>
     */
    private List<Org> getChildren(Long id, List<Org> orgs) {
        // 1.找出子节点
        List<Org> children = orgs.stream()
                .filter(Org -> Objects.equals(id, Org.getParentId()))
                .toList();
        // 2.为子节点设置子节点
        children.forEach(Org -> {
            Org.setChildren(getChildren(Org.getId(), orgs));
        });
        return children;
    }

    /**
     * 递归查找子节点下的所有节点列表
     *
     * @param parentId 父节点id
     * @param orgs     列表
     * @return 子节点下的节点列表
     */
    private List<Org> listById(Long parentId, List<Org> orgs) {
        List<Org> orgListByParentId = new ArrayList<>();
        // 找出 parentId 等于 org.getParentId() 的数据
        for (Org org : orgs) {
            if (parentId.equals(org.getParentId())) {
                orgListByParentId.add(org);
            }
        }
        List<Org> orgList = new ArrayList<>(orgListByParentId);
        // 递归查找子节点数据
        for (Org org : orgListByParentId) {
            List<Org> orgsById = listById(org.getId(), orgs);
            if (!orgsById.isEmpty()) {
                // 防止并非修改错误，不能直接使用 orgListByParentId 添加
                orgList.addAll(orgsById);
            }
        }
        return orgList;
    }

}
