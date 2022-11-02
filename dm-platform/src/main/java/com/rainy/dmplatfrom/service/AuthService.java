package com.rainy.dmplatfrom.service;

import com.rainy.dmplatfrom.entity.UserDataRel;
import org.aopalliance.reflect.Code;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 22:14
 */
public interface AuthService {

    UserDataRel auth(List<String> codes);
}
