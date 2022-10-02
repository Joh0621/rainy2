package com.rainy.base.common.utils;

import cn.dev33.satoken.stp.StpUtil;
import com.rainy.base.entity.User;

/**
 * todo
 *
 * @author Created by renguangli at 2022/9/26 16:44
 */
public class SaTokenUtils {

    public static Long getUserId(){
        return 1L;
    }

    public static String getUsername(){
        return "admin";
    }

    public static User getUserinfo(){
        return (User) StpUtil.getSessionByLoginId(StpUtil.getLoginId()).get("userinfo");
    }

    public static void setUserinfo(User user) {
        StpUtil.getSessionByLoginId(user.getId()).set("userinfo", user);
    }
}
