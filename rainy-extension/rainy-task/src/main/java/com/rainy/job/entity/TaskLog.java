package com.rainy.job.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.OrderBy;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.framework.utils.DateUtils;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/11/7 11:24
 */
@Data
@TableName("t_task_log")
public class TaskLog {

    @TableId(type = IdType.AUTO)
    private Long id;
    private String name;
    private String category;
    private String className;
    @OrderBy
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    private LocalDateTime datetime;
    private long processTime;
    private Boolean success;
    private String errorMessage;

}

