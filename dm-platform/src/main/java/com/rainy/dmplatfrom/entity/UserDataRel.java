package com.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.framework.utils.DateUtils;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/26 16:53
 */
@Data
@TableName("biz_user_data_rel")
public class UserDataRel {

    @TableId(type = IdType.ASSIGN_ID)
    private Long id;
    private Long dataId;
    /**
     * 0.时序数据
     * 1.关系表
     */
    private Integer dataType;
    private String dataName;
    private String dataCode;
    private Long orgId;
    private String orgName;
    private Long dataDirectionId;
    private String dataDirectionName;
    private Long applyUserId;
    private String applyUsername;
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    private LocalDateTime applyTime;
    private Integer approved;
    private String processInstanceId;
    private String processDefinitionId;

}
