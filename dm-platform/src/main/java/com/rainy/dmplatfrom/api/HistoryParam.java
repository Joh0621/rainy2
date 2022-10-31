package com.rainy.dmplatfrom.api;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.framework.utils.DateUtils;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.List;

/**
 * data-service-apis
 *
 * @author Created by renguangli at 2022/10/31 10:34
 */
@Data
public class HistoryParam {

    @NotEmpty
    private List<String> codes;

    @NotNull
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    @DateTimeFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    private LocalDateTime startTime;

    @NotNull
    @JsonFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    @DateTimeFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS)
    private LocalDateTime endTime;

}
