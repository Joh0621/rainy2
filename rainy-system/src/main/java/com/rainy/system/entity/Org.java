package com.rainy.system.entity;

import com.baomidou.mybatisplus.annotation.OrderBy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.rainy.framework.constant.CommonConstants;
import com.rainy.framework.validation.Group;
import com.rainy.framework.validation.unique.NotUnique;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * 组织实体类
 *
 * @author Created by renguangli at 2022/9/13 0013 21:52
 */
@Getter
@Setter
@ToString
@TableName("t_org")
public class Org extends BaseEntity {

    @PositiveOrZero
    private Long parentId;

    @NotBlank
    @NotUnique(groups = {Group.Add.class, Group.Edit.class}, entity = Org.class)
    private String name;

    @NotBlank
    @NotUnique(groups = {Group.Add.class, Group.Edit.class}, entity = Org.class, field = "code")
    private String code;

    @Positive
    @OrderBy(asc = true)
    private Integer sort;

    @Size(max = CommonConstants.MAX_SIZE)
    private String description;

    @TableField(exist = false)
    private List<Org> children;

}
