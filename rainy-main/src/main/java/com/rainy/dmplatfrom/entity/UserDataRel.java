package com.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/26 16:53
 */
@Data
@TableName("biz_user_data_rel")
public class UserDataRel {

    @TableId(type = IdType.AUTO)
    private Long id;
    private Long userId;
    private Long orgId;
    private Long dataDirectionId;
    private Long dataId;
    private String applyUsername;
    private LocalDateTime applyTime;
    private int approved;
    private LocalDateTime approvedTime;
    private String approvedUsername;

    public UserDataRel(Long userId, Long orgId, Long dataDirectionId, Long dataId) {
        this.userId = userId;
        this.orgId = orgId;
        this.dataDirectionId = dataDirectionId;
        this.dataId = dataId;
    }
}
