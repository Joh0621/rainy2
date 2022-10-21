package com.rainy.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/21 12:32
 */
@Data
@TableName("t_role_data_permission_rel")
public class RoleDataPermission {

    @TableId(type = IdType.ASSIGN_ID)
    private Long id;
    private Long roleId;
    private Long orgId;
    private boolean half;

}
