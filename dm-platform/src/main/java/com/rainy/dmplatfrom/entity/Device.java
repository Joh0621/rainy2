package com.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.rainy.system.entity.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/15 10:01
 */
@Data
@TableName("biz_device")
public class Device extends BaseEntity {

    @TableId(type = IdType.AUTO)
    private Long id;
    @NotNull
    private Long dataDirectoryId;
    @NotBlank
    private String name;
    @NotBlank
    private String code;
    @NotNull
    private Integer updateFrequency;
    @NotNull
    private Long OrgId;
    @NotBlank
    private String responsible;
    @PositiveOrZero
    private Integer major;
    @Size(max = 128)
    private String description;

}
