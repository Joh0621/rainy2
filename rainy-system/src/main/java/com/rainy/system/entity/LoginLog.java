package com.rainy.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.OrderBy;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.framework.utils.DateUtils;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * 登录日志实体类
 *
 * @author Created by renguangli at 2022/9/13 19:25
 */
@Data
@TableName("t_login_log")
public class LoginLog {

    @TableId(type = IdType.ASSIGN_ID)
    private Long id;
    private String username;
    private int type;

    @OrderBy
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    private LocalDateTime datetime;
    private String browser;
    private String os;
    private String ip;
    private boolean success;
    private String errorMessage;

}
