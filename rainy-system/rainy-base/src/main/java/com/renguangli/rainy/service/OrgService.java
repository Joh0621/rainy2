package com.renguangli.rainy.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.renguangli.rainy.entity.Org;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/13 0013 22:14
 */
public interface OrgService extends BaseService<Org> {

    List<Org> tree();

    List<Org> list(Org org);
}
