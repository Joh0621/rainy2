package com.rainy.base.common.utils;

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
        User user = new User();
        user.setId(1L);
        user.setUsername("admin");
        user.setOrgId(5L);
        return user;
    }
}
