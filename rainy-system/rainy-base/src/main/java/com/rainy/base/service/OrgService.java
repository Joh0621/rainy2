package com.rainy.base.service;

import com.rainy.base.entity.Org;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/13 0013 22:14
 */
public interface OrgService extends BaseService<Org> {

    List<Org> tree();

    List<Long> getChildrenIds(Long id);
}
