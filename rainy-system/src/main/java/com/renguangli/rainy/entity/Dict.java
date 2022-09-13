package com.renguangli.rainy.entity;

import com.baomidou.mybatisplus.annotation.OrderBy;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;

/**
 * 字典实体类
 *
 * @author Created by renguangli at 2022/9/5 19:20
 */
@Getter
@Setter
@ToString
@TableName("t_dict")
public class Dict extends BaseEntity {

    @NotBlank
    private String categoryCode;

    @NotBlank
    private String name;

    @NotBlank
    private String code;

    @NotBlank
    private String dataType;

    @Positive
    @OrderBy(asc = true)
    private Boolean sort;

    @Size(max = 128)
    private String description;
}
