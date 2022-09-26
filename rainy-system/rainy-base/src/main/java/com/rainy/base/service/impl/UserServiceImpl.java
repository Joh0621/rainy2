package com.rainy.base.service.impl;

import com.rainy.base.entity.User;
import com.rainy.base.mapper.UserMapper;
import com.rainy.base.service.UserService;
import org.springframework.stereotype.Service;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/14 0014 6:36
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<UserMapper, User> implements UserService {

}
