package com.renguangli.rainy.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 用户实体类
 *
 * @author Created by renguangli at 2022/9/13 0013 22:32
 */
@Getter
@Setter
@ToString
@TableName("t_user")
public class User extends BaseEntity {

    private Long orgId;
    private String username;
    @JsonIgnore
    private String password;
    private String nickName;
    private String avatar;
    private LocalDate birthday;
    private String email;
    private String telephone;
    private Integer status;
    private Long loginCount;
    private LocalDateTime usernameExpiredTime;
    private LocalDateTime passwordExpiredTime;

}
