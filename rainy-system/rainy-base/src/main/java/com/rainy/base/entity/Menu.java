package com.rainy.base.entity;

import com.baomidou.mybatisplus.annotation.OrderBy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.rainy.base.common.constant.CommonConstants;
import com.rainy.base.common.validation.Group;
import com.rainy.base.common.validation.unique.NotUnique;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.*;
import java.util.List;

/**
 * 菜单实体类
 *
 * @author renguangli
 * @date 2022/8/30 09:48
 */
@Getter
@Setter
@ToString
@TableName("t_menu")
public class Menu extends BaseEntity {

    @PositiveOrZero
    private Long parentId;

    @NotBlank
    @NotUnique(groups = Group.Add.class, entity = Menu.class)
    private String name;
    @NotUnique(groups = Group.Add.class, entity = Menu.class, field = "path")
    private String path;
    @NotBlank
    private String component;

    @Positive
    private Integer type;
    @NotBlank
    @NotUnique(groups = Group.Add.class, entity = Menu.class, field = "title")
    private String title;
    private String icon;
    private String url;

    private String permission;

    @NotNull
    @TableField("`show`")
    private Boolean show;

    @Positive
    @OrderBy(asc = true)
    private Integer sort;

    @Size(max = CommonConstants.MAX_SIZE)
    private String description;

    @TableField(exist = false)
    List<Menu> children;

}
