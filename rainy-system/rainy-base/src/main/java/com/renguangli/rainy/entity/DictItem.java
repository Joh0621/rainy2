package com.renguangli.rainy.entity;

import com.baomidou.mybatisplus.annotation.OrderBy;
import com.baomidou.mybatisplus.annotation.TableName;
import com.renguangli.rainy.common.constant.CommonConstants;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;
import javax.validation.constraints.Size;

/**
 * 字典项实体类
 *
 * @author Created by renguangli at 2022/9/5 19:20
 */
@Getter
@Setter
@ToString
@TableName("t_dict_item")
public class DictItem extends BaseEntity {

    @NotBlank
    private String dictCode;

    @NotBlank
    private String code;

    @NotBlank
    private String value;

    @Positive
    @OrderBy(asc = true)
    private Integer sort;

    @Size(max = CommonConstants.MAX_SIZE)
    private String description;
}
