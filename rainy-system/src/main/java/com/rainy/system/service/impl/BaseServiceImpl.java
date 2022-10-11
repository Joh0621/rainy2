package com.rainy.system.service.impl;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rainy.system.service.BaseService;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/5 17:10
 */
public class BaseServiceImpl<M extends BaseMapper<T>, T> extends ServiceImpl<M, T> implements BaseService<T> {

    @Override
    public boolean exists(SFunction<T, ?> sFunction, Object value) {

        return this.lambdaQuery().eq(sFunction, value).one() == null;
    }

    @Override
    public boolean exists(Integer id, String column, Object value) {
        return false;
    }
}
