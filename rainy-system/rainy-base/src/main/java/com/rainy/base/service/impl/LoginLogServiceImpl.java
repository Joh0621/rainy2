package com.rainy.base.service.impl;

import com.rainy.base.entity.LoginLog;
import com.rainy.base.mapper.LoginLogMapper;
import com.rainy.base.service.LoginLogService;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/13 0013 22:24
 */
@Service
public class LoginLogServiceImpl extends BaseServiceImpl<LoginLogMapper, LoginLog> implements LoginLogService {

    @Async
    @Override
    public void asyncSave(LoginLog loginLog) {
        this.save(loginLog);
    }
}
