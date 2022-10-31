package com.rainy.job.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.rainy.system.entity.BaseEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/28 15:23
 */
@Getter
@Setter
@ToString
@TableName("t_task")
public class ScheduleTask extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long id;
    private String category;
    private String name;
    private String cron;
    private String className;
    private Integer status;
    private String description;

}
