package com.renguangli.rainy.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.renguangli.rainy.entity.User;
import com.renguangli.rainy.mapper.UserMapper;
import com.renguangli.rainy.service.UserService;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Map;
import java.util.function.Function;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/14 0014 6:36
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<UserMapper, User> implements UserService {

}
