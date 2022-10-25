package com.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.framework.utils.DateUtils;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/15 10:01
 */
@Data
@TableName("biz_device")
public class Device {

    @TableId(type = IdType.ASSIGN_ID)
    private Long id;
    @NotNull
    private Long dataDirectoryId;
    private String dataDirectoryName;
    @NotBlank
    @OrderBy(asc = true)
    private String name;
    @NotBlank
    private String code;
    @NotNull
    private Integer updateFrequency;
    @NotNull
    private Long orgId;
    private String orgName;
    @NotBlank
    private String responsible;
    @PositiveOrZero
    private Integer major;
    private Integer pointCount;
    @Size(max = 128)
    private String description;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    private LocalDateTime updateTime;

}
