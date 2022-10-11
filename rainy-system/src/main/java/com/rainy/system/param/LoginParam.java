package com.rainy.system.param;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/29 12:03
 */
@Data
public class LoginParam {

    @NotBlank
    private String username;
    @NotBlank
    private String password;
    @NotNull
    private Boolean rememberMe;
}
