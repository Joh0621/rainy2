package com.rainy.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/19 17:51
 */
@Data
@TableName("t_user_role_rel")
public class UserRoleRel {

    @TableId(type = IdType.AUTO)
    private Long id;
    private Long userId;
    private Long roleId;

    public UserRoleRel(Long userId, Long roleId) {
        this.userId = userId;
        this.roleId = roleId;
    }
}
