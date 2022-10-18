package com.rainy.workflow.param;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/26 18:40
 */
@Data
public class ApproveParam {

    @NotBlank
    private String taskId;
    /**
     * 1.审批通过
     * 2.审批未通过
     */
    @NotNull
    private Integer approved;
    @NotBlank
    private String remarks;
}
