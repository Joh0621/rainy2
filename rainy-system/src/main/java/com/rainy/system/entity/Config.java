package com.rainy.system.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.rainy.framework.constant.CommonConstants;
import com.rainy.framework.validation.Group;
import com.rainy.framework.validation.unique.NotUnique;
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
    @NotUnique(groups = {Group.Add.class, Group.Edit.class}, entity = Config.class)
    private String name;

    @NotBlank
    @NotUnique(groups = {Group.Add.class, Group.Edit.class}, entity = Config.class, field = "code")
    private String code;

    @NotBlank
    private String dataType;

    @NotBlank
    private String value;

    @Size(max = CommonConstants.MAX_SIZE)
    private String description;

}
