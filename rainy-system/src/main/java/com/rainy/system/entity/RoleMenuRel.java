package com.rainy.system.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/28 0028 22:56
 */
@Data
@NoArgsConstructor
@TableName("t_role_menu_rel")
public class RoleMenuRel {

    @TableId(type = IdType.AUTO)
    private Long id;
    private Long roleId;
    private Long menuId;
    /**
     * 是否半选状态
     */
    private Boolean half;

    public RoleMenuRel(Long roleId, Long menuId, Boolean half) {
        this.roleId = roleId;
        this.menuId = menuId;
        this.half = half;
    }
}
