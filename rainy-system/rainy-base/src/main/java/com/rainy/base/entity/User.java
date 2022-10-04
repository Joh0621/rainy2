package com.rainy.base.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.base.common.utils.DateUtils;
import com.rainy.base.common.validation.Group;
import com.rainy.base.common.validation.unique.NotUnique;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
    @NotNull
    private String password;
    @NotUnique(groups = Group.Add.class, entity = User.class, field = "nick_name")
    private String nickName;
    private String avatar;
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD)
    @DateTimeFormat(pattern = DateUtils.YYYY_MM_DD)
    private LocalDate birthday;
    private String email;
    @Pattern(regexp = "^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$")
    private String telephone;
    @NotNull
    private Integer status;
    private Long loginCount;
    private LocalDateTime usernameExpiredTime;
    private LocalDateTime passwordExpiredTime;

}
