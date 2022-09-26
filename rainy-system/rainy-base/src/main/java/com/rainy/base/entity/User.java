package com.rainy.base.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.rainy.base.common.validation.Group;
import com.rainy.base.common.validation.unique.NotUnique;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotNull;
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
    @NotNull
    @NotUnique(groups = Group.Add.class, entity = User.class, field = "username")
    private String username;
    @JsonIgnore
    @NotNull
    private String password;
    @NotUnique(groups = Group.Add.class, entity = User.class, field = "nickName")
    private String nickName;
    private String avatar;
    private LocalDate birthday;
    private String email;
    private String telephone;
    @NotNull
    private Integer status;
    private Long loginCount;
    private LocalDateTime usernameExpiredTime;
    private LocalDateTime passwordExpiredTime;

}
