package com.rainy.service.impl;

import com.rainy.entity.User;
import com.rainy.mapper.UserMapper;
import com.rainy.service.UserService;
import org.springframework.stereotype.Service;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/14 0014 6:36
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<UserMapper, User> implements UserService {

}
