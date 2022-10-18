package com.rainy.framework.common;

import lombok.Data;

import java.time.LocalDate;
import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/10/11 16:33
 */
@Data
public class Userinfo {

    private Long id;
    private String username;
    private String nickName;
    private LocalDate birthday;
    private String avatar;
    private String telephone;
    private String email;
    private Long orgId;
    private String org;
    private String position;
    private List<String> roles;
    private List<String> permissions;
    private List<?> menus;

}
