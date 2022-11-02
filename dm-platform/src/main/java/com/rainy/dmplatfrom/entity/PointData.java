package com.rainy.dmplatfrom.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rainy.framework.utils.DateUtils;
import lombok.Data;
import org.influxdb.annotation.Column;
import org.influxdb.annotation.Measurement;

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.concurrent.TimeUnit;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 22:01
 */
@Data
@Measurement(database = "iot_access_link", name = "iot_ncepri")
public class PointData {

    @Column(name = "time")
    private Instant time;
    @Column(name = "code", tag = true)
    private String code;
    @Column(name = "value")
    private Double value;

    public String getTime(){
        return DateUtils.parse(this.time).format(DateUtils.getDtf(DateUtils.YYYY_MM_DD_HH_MM_SS));
    }

}
