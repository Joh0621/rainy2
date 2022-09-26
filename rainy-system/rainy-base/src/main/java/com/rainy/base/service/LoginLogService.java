package com.rainy.base.service;

import com.rainy.base.entity.LoginLog;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/13 0013 22:24
 */
public interface LoginLogService extends BaseService<LoginLog> {

    void asyncSave(LoginLog loginLog);
}
