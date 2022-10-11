package com.rainy.system.service;

import com.rainy.system.entity.Config;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/5 17:16
 */
public interface ConfigService extends BaseService<Config> {

    String get(String code);

    int getAsInt(String code);

    boolean getAsBoolean(String code);

    boolean update(Config config);

}
