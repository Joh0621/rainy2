package com.rainy.dmplatfrom.param;

import com.rainy.dmplatfrom.entity.Device;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/19 10:09
 */
@Data
public class BatchApplyParam {

    @NotNull
    private Integer dataType;
    private List<String> dataIds;
    private String remarks;

}
