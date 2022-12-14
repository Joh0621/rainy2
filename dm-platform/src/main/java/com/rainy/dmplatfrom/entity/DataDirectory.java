package com.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.OrderBy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.rainy.system.entity.BaseEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/14 16:23
 */
@Getter
@Setter
@ToString
@TableName("biz_data_directory")
public class DataDirectory extends BaseEntity {

    @NotNull
    private Long orgId;
    private String orgName;
    @NotNull
    private Long parentId;
    @NotBlank
    private String name;
    @NotBlank
    private String code;
    @NotNull
    private Integer type;
    @NotNull
    private Boolean isDirectory;
    @NotNull
    @OrderBy(asc = true)
    private Integer sort;
    @Size(max = 128)
    private String description;

    @TableField(exist = false)
    List<DataDirectory> children;
}
