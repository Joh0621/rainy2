package com.renguangli.rainy.entity;

import com.baomidou.mybatisplus.annotation.OrderBy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.*;

/**
 * 菜单实体类
 *
 * @author renguangli
 * @date 2022/8/30 09:48
 */
@Getter
@Setter
@ToString
@TableName("t_menu_2")
public class Menu extends BaseEntity {

    @NotNull
    @PositiveOrZero
    private Long parentId;

    @NotBlank
    private String name;
    private String path;
    private String component;

    @Positive
    private Integer type;
    @NotBlank
    private String title;
    private String icon;
    private String url;

    private String permission;

    @NotNull
    @TableField("`show`")
    private Boolean isShow;

    @Positive
    @OrderBy(asc = true)
    private Boolean sort;

    @Size(max = 128)
    private String description;

}
