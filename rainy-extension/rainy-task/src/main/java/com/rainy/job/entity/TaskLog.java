package com.rainy.job.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.framework.utils.DateUtils;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/11/7 11:24
 */
@Data
@TableName("t_task_log")
public class TaskLog {

    @TableId(type = IdType.AUTO)
    private Integer id;
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

