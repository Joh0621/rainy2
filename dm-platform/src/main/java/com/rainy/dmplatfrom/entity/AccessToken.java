package com.rainy.dmplatfrom.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/24 12:04
 */
@Data
@TableName("biz_access_token")
public class AccessToken {

    @TableId(type = IdType.ASSIGN_ID)
    private Long id;
    private Long userDataId;
    private String accessToken;

}
