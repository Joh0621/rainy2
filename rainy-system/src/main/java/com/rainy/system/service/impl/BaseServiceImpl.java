package com.rainy.system.service.impl;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rainy.system.service.BaseService;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/5 17:10
 */
public class BaseServiceImpl<M extends BaseMapper<T>, T> extends ServiceImpl<M, T> implements BaseService<T> {

}
