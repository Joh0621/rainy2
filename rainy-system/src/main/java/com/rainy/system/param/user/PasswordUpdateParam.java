package com.rainy.system.param.user;

import cn.hutool.core.bean.BeanUtil;
import com.rainy.system.entity.User;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/10/4 21:59
 */
@Data
public class PasswordUpdateParam {

    @NotBlank
    private String oldPassword;
    @NotBlank
    private String password;
    @NotBlank
    private String configPassword;

    public User convert() {
        return BeanUtil.copyProperties(this, User.class);
    }

}
