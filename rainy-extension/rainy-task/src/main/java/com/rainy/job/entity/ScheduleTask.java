package com.rainy.job.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.rainy.system.entity.BaseEntity;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

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
    @NotBlank
    private String category;
    @NotBlank
    private String name;
    @NotBlank
    private String cron;
    @NotBlank
    private String className;
    @NotNull
    private Integer status;
    private String description;

}
