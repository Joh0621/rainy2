package com.renguangli.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.renguangli.rainy.entity.BaseEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/14 16:23
 */
@Getter
@Setter
@ToString
@TableName("biz_data_directory")
public class DataDirectory extends BaseEntity {

    private Long parentId;
    private String name;
    private String code;
    private String description;

    @TableField(exist = false)
    List<DataDirectory> children;
}
