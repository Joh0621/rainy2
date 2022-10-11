package com.rainy.framework.utils;

import cn.dev33.satoken.stp.StpUtil;
import com.rainy.framework.common.Userinfo;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/10/11 16:35
 */
public class SecurityUtils {

    private static final String CURRENT_USERINFO_KEY = "current_userinfo";

    public static void setUserinfo(Userinfo userinfo) {
        StpUtil.getSessionByLoginId(getUserId())
                .set(CURRENT_USERINFO_KEY, userinfo);
    }

    /**
     * 获取当前登录用户名id
     */
    public static Long getUserId(){
        return StpUtil.getLoginIdAsLong();
    }

    /**
     * 获取当前登录用户名
     */
    public static String getUsername(){
        return getUserinfo().getUsername();
    }

    /**
     * 获取当前登录用户信息
     */
    public static Userinfo getUserinfo(){
        return getUserinfo(getUserId());
    }

    public static Userinfo getUserinfo(Object loginId){
        return (Userinfo) StpUtil.getSessionByLoginId(loginId)
                .get(CURRENT_USERINFO_KEY);
    }

}
