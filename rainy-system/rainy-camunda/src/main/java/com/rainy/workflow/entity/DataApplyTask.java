package com.rainy.workflow.entity;

import lombok.Data;

import java.util.Date;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/23 17:57
 */
@Data
public class DataApplyTask {

    private String assignee;
    private Date createTime;
    private String flag;
}
