package com.rainy.workflow.param;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/26 18:40
 */
@Data
public class ApproveParam {

    @NotBlank
    private String taskId;
    @NotNull
    private Boolean approved;
    @NotBlank
    private String remarks;
}
