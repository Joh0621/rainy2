package com.rainy.dmplatfrom.api;

import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 21:51
 */
@Data
public class RealTimeParam {

    @NotEmpty
    private List<String> codes;
}
