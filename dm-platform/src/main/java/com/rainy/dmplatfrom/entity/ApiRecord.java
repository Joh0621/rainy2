package com.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 22:39
 */
@Data
@TableName("biz_api_record")
public class ApiRecord {

    @TableId(type = IdType.AUTO)
    private Long id;
    private String apiCode;
    private Long responseTime;
    private Long dataSize;

}
