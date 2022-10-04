package com.rainy.base.common.utils;

import cn.dev33.satoken.stp.StpUtil;
import com.rainy.base.entity.User;

/**
 * todo
 *
 * @author Created by renguangli at 2022/9/26 16:44
 */
public class SaTokenUtils {

    private static final String USERINFO_SESSION_KEY = "userinfo";

    public static Long getUserId(){
        return StpUtil.getLoginIdAsLong();
    }

    public static String getUsername(){
        return getUserinfo().getUsername();
    }

    public static User getUserinfo(){
        return getUserinfo(StpUtil.getLoginId());
    }

    public static User getUserinfo(Object loginId){
        return (User) StpUtil.getSessionByLoginId(loginId).get(USERINFO_SESSION_KEY);
    }

    public static void setUserinfo(User user) {
        StpUtil.getSessionByLoginId(user.getId()).set(USERINFO_SESSION_KEY, user);
    }

}
