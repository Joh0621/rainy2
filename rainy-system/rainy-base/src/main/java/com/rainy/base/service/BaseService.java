package com.rainy.base.service;

import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/5 17:09
 */
public interface BaseService<T> extends IService<T> {

    boolean exists(SFunction<T, ?> sFunction, Object value);

    boolean exists(Integer id, String column, Object value);

}
