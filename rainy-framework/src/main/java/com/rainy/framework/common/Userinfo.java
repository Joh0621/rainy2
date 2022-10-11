package com.rainy.framework.common;

import lombok.Data;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/11 16:33
 */
@Data
public class Userinfo {

    private Long id;
    private Long orgId;
    private String username;
    private String nickName;
    private String avatar;
    private List<String> roles;
    private List<String> permissions;

}
