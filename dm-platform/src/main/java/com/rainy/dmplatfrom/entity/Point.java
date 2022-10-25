package com.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/20 15:10
 */
@Data
@TableName("biz_point")
public class Point {

    @TableId(type = IdType.AUTO)
    private Long id;
    @NotBlank
    private String deviceCode;
    private String deviceName;
    @NotBlank
    private String code;
    @NotBlank
    private String name;
}
