package com.rainy.system.param.user;

import cn.hutool.core.bean.BeanUtil;
import com.rainy.system.entity.User;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import static com.rainy.system.entity.User.PASSWORD_REGEX;

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
    @Pattern(regexp = PASSWORD_REGEX, message = "密码至少8位且包含大写字母、小写字母、数字或特殊符号中的任意三种!")
    private String password;
    @NotBlank
    private String confirmPassword;

}
