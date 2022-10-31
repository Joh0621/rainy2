package com.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/25 18:07
 */
@Data
@TableName("biz_interface")
public class Interface {

    @TableId(type = IdType.AUTO)
    private Long id;
    private String name;
    private String code;
    private String description;
    private Integer status;
    @TableField(exist = false)
    private Long totalCount;
    @TableField(exist = false)
    private Long avgResponseTime;
    @TableField(exist = false)
    private Long totalDataSize;

}
