package com.rainy.workflow.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.framework.utils.DateUtils;
import lombok.Data;

import java.util.Date;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/12 16:37
 */
@Data
public class Activity {

    private String name;
    private String assignee;
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    private Date datetime;
}
