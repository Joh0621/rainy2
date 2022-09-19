package com.renguangli.rainy.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * 配置实体类
 *
 * @author Created by renguangli at 2022/9/5 17:11
 */
@Getter
@Setter
@ToString
@TableName("t_config")
public class Config extends BaseEntity {

    @NotBlank
    private String categoryCode;

    @NotBlank
    private String name;

    @NotBlank
    private String code;

    @NotBlank
    private String dataType;

    @NotBlank
    private String value;

    @Size(max = 128)
    private String description;

}
