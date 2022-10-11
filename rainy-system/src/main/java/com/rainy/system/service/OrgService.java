package com.rainy.system.service;

import com.rainy.system.entity.Org;

import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/13 0013 22:14
 */
public interface OrgService extends BaseService<Org> {

    List<Org> tree();

    List<Long> getChildrenIds(Long id);
}
