package com.rainy.entity;

import com.baomidou.mybatisplus.annotation.OrderBy;
import com.baomidou.mybatisplus.annotation.TableName;
import com.rainy.common.constant.CommonConstants;
import com.rainy.common.validation.Group;
import com.rainy.common.validation.unique.NotUnique;
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
    @NotUnique(groups = Group.Add.class, entity = Dict.class)
    private String name;

    @NotBlank
    @NotUnique(groups = Group.Add.class, entity = Dict.class, field = "code")
    private String code;

    @NotBlank
    private String dataType;

    @Positive
    @OrderBy(asc = true)
    private Integer sort;

    @Size(max = CommonConstants.MAX_SIZE)
    private String description;
}
