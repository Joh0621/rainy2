package com.rainy.framework.common;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.framework.utils.DateUtils;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.sql.Ref;
import java.time.LocalDate;
import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/10/11 16:33
 */
@Data
public class Userinfo {

    @NotNull
    private Long id;
    private String username;
    private String nickName;
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD)
    private LocalDate birthday;
    private String avatar;
    @Pattern(regexp = "^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$", message = "手机号格式不正确")
    private String telephone;
    @Email
    private String email;
    private String org;
    /**
     * 本部门以及子部门id
     */
    private Long orgId;
    private List<Long> orgIds;
    private List<String> roles;
    private List<String> permissions;
    private List<?> menus;

}
