package com.rainy.dmplatfrom.service;

import com.rainy.dmplatfrom.entity.UserDataRel;
import com.rainy.system.service.BaseService;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/26 16:55
 */
public interface UserDataRelService extends BaseService<UserDataRel> {

    boolean cancelApply(Long userDataId);

}
