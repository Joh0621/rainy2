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
 * 操作日志实体类
 *
 * @author Created by renguangli at 2022/9/13 19:20
 */
@Data
@TableName("t_operation_log")
public class OperationLog {

    @TableId(type = IdType.ASSIGN_ID)
    private Integer id;
    private String module;
    private String type;
    private String username;
    @OrderBy
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    private LocalDateTime datetime;
    private String detail;

    private String path;
    private String method;
    private String remoteIp;
    private String browser;
    private String os;

    private String className;
    private String methodName;
    private String params;
    private String result;
    private boolean success;
    private String errorMessage;
    private long processTime;

}
