package com.rainy.dmplatfrom.service;

import com.rainy.dmplatfrom.entity.Interface;
import com.rainy.system.service.BaseService;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/25 18:08
 */
public interface InterfaceService extends BaseService<Interface> {

    Interface getByCode(String realTimeApiCode);

}
