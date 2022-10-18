package com.rainy.dmplatfrom.param;

import com.rainy.dmplatfrom.entity.Device;
import lombok.Data;

import javax.validation.constraints.NotNull;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/19 10:09
 */
@Data
public class ApplyParam {

    @NotNull
    private Integer dataType;
    private Device device;
    private String remarks;
}
