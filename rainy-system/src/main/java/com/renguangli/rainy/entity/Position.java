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
 * 职位实体类
 *
 * @author Created by renguangli at 2022/9/13 0013 21:52
 */
@Getter
@Setter
@ToString
@TableName("t_position")
public class Position extends BaseEntity {

    @NotBlank
    private String name;

    @NotBlank
    private String code;

    @Positive
    @OrderBy(asc = true)
    private Integer sort;

    @Size(max = 128)
    private String description;

}
