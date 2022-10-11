package com.rainy.system.entity;

import com.baomidou.mybatisplus.annotation.OrderBy;
import com.baomidou.mybatisplus.annotation.TableName;
import com.rainy.framework.constant.CommonConstants;
import com.rainy.framework.validation.Group;
import com.rainy.framework.validation.unique.NotUnique;
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
    @NotUnique(groups = {Group.Add.class, Group.Edit.class}, entity = Position.class)
    private String name;

    @NotBlank
    @NotUnique(groups = {Group.Add.class, Group.Edit.class}, entity = Position.class, field = "code")
    private String code;

    @Positive
    @OrderBy(asc = true)
    private Integer sort;

    @Size(max = CommonConstants.MAX_SIZE)
    private String description;

}
