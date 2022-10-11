package com.rainy.system.service.impl;

import com.rainy.system.entity.LoginLog;
import com.rainy.system.mapper.LoginLogMapper;
import com.rainy.system.service.LoginLogService;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/13 22:24
 */
@Service
public class LoginLogServiceImpl extends BaseServiceImpl<LoginLogMapper, LoginLog> implements LoginLogService {

    @Async
    @Override
    public void asyncSave(LoginLog loginLog) {
        this.save(loginLog);
    }
}
