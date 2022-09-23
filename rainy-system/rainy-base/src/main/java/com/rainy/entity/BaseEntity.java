package com.rainy.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.rainy.common.validation.Group;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.Null;
import java.time.LocalDateTime;

/**
 * 基础实体类
 *
 * @author created by renguangli at 2022/8/30 17:34
 */
@Getter
@Setter
@ToString
public class BaseEntity {

    @Null(groups = {Group.Add.class})
    @TableId(type = IdType.AUTO)
    private Long id;

    @TableField(fill = FieldFill.INSERT)
    @JsonIgnore
    private String createBy;

    @TableField(fill = FieldFill.INSERT)
    @JsonIgnore
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonIgnore
    private String updateBy;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    @JsonIgnore
    private LocalDateTime updateTime;

    @JsonIgnore
    @TableLogic
    private Boolean delFlag;

    @JsonIgnore
    public String getStringId() {
        return String.valueOf(this.id);
    }

}
