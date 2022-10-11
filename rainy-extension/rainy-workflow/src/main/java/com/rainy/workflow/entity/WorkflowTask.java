package com.rainy.workflow.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.framework.utils.DateUtils;
import lombok.Data;

import java.util.Date;
import java.util.Map;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/26 18:34
 */
@Data
public class WorkflowTask {


    /**
     * 任务id
     */
    private String id;
    /**
     * 流程名称
     */
    private String processName;
    /**
     * 任务发起人
     */
    private String startBy;
    /**
     * 任务发起人
     */
    private String assignee;
    /**
     * 节点名称
     */
    private String name;

    @JsonFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS, timezone = DateUtils.ZONE_OFFSET_CST)
    private Date startTime;
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS, timezone = DateUtils.ZONE_OFFSET_CST)
    private Date endTime;
    private Long durationInMillis;
    /**
     * 截止时间
     */
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS, timezone = DateUtils.ZONE_OFFSET_CST)
    private Date dueDate;
    private boolean finished;
    Map<String, Object> variables;

}
