package com.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.framework.utils.DateUtils;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

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
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    @DateTimeFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    private LocalDateTime datetime;
    private String username;
    private String apiCode;
    private Long responseTime;
    private Long dataSize;

}
