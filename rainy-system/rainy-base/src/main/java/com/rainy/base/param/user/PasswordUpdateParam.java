package com.rainy.base.param.user;

import cn.hutool.core.bean.BeanUtil;
import com.rainy.base.entity.User;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/4 21:59
 */
@Data
public class PasswordUpdateParam {

    @NotBlank
    private String username;
    @NotBlank
    private String password;

    public User convert() {
        return BeanUtil.copyProperties(this, User.class);
    }

}
