package com.rainy.system.entity;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.framework.common.Userinfo;
import com.rainy.framework.utils.DateUtils;
import com.rainy.framework.validation.Group;
import com.rainy.framework.validation.unique.NotUnique;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
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

    public static final String PASSWORD_REGEX = "^(?![a-zA-Z]+$)(?![A-Z0-9]+$)(?![A-Z\\W_]+$)(?![a-z0-9]+$)(?![a-z\\W_]+$)(?![0-9\\W_]+$)[a-zA-Z0-9\\W_]{8,20}$";

    private Long orgId;
    @NotNull
    @NotUnique(groups = {Group.Add.class, Group.Edit.class}, entity = User.class, field = "username")
    private String username;
    @NotNull

    @Pattern(regexp = PASSWORD_REGEX, message = "密码至少8位且包含大写字母、小写字母、数字或特殊符号中的任意三种!")
    private String password;
    @NotUnique(groups = {Group.Add.class, Group.Edit.class}, entity = User.class, field = "nick_name")
    private String nickName;
    private String avatar;
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD)
    @DateTimeFormat(pattern = DateUtils.YYYY_MM_DD)
    private LocalDate birthday;
    @Email
    private String email;
    @Pattern(regexp = "^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\\d{8}$", message = "手机号格式不正确")
    private String telephone;
    @NotNull
    private Integer status;
    private Long loginCount;
    private LocalDateTime usernameExpiredTime;
    private LocalDateTime passwordExpiredTime;

    public Userinfo userinfo(){
        return BeanUtil.copyProperties(this, Userinfo.class);
    }
}
