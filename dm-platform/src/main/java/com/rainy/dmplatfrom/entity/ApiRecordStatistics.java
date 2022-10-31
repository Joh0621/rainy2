package com.rainy.dmplatfrom.entity;

import lombok.Data;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 22:55
 */
@Data
public class ApiRecordStatistics {

    private String apiCode;
    private Long totalCount;
    private Long avgResponseTime;
    private Long totalDataSize;
}
