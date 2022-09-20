package com.renguangli.rainy.dmplatfrom.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.renguangli.rainy.dmplatfrom.entity.Point;
import com.renguangli.rainy.dmplatfrom.mapper.PointMapper;
import com.renguangli.rainy.dmplatfrom.service.PointService;
import com.renguangli.rainy.service.impl.BaseServiceImpl;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Map;
import java.util.function.Function;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/20 17:06
 */
@Service
public class PointServiceImpl extends BaseServiceImpl<PointMapper, Point> implements PointService {

}
