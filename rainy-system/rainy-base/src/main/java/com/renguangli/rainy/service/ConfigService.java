package com.renguangli.rainy.service;

import com.renguangli.rainy.entity.Config;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/5 17:16
 */
public interface ConfigService extends BaseService<Config> {

    String get(String code);

    int getAsInt(String code);

    boolean getAsBoolean(String code);

    boolean update(Config config);

}
