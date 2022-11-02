package com.rainy.dmplatfrom.service.impl;

import cn.hutool.core.util.StrUtil;
import com.rainy.dmplatfrom.entity.PointData;
import com.rainy.dmplatfrom.influxdb.InfluxdbClient;
import com.rainy.dmplatfrom.service.PointDataService;
import com.rainy.framework.utils.DateUtils;
import lombok.RequiredArgsConstructor;
import org.apache.iotdb.rpc.IoTDBConnectionException;
import org.apache.iotdb.rpc.StatementExecutionException;
import org.apache.iotdb.session.pool.SessionDataSetWrapper;
import org.apache.iotdb.session.pool.SessionPool;
import org.apache.iotdb.tsfile.read.common.Field;
import org.apache.iotdb.tsfile.read.common.RowRecord;
import org.influxdb.annotation.Measurement;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 22:02
 */
@Service
@RequiredArgsConstructor
public class PointDataServiceImpl implements PointDataService {

    private final SessionPool sessionPool;
    private final InfluxdbClient influxdbClient;

    @Override
    public List<PointData> listPoints(List<String> codes) {
        Measurement m = PointData.class.getAnnotation(Measurement.class);
        LocalDateTime dateTime = LocalDateTime.now().minusDays(7);
        String whereSql = this.whereSql(codes);
        String command = StrUtil.format("select time,code,last(value) as value from {}.autogen.{} " +
                        whereSql +
                        " and time > '{}' " +
                        "group by code " +
                        "tz('Asia/Shanghai')",
                m.database(), m.name(), DateUtils.format(dateTime));
        return influxdbClient.query(command, PointData.class);
    }

    private String whereSql(List<String> codes) {
        StringBuilder whereSql = new StringBuilder();
        for (int i = 0; i < codes.size(); i++) {
            whereSql.append( i == 0 ? "where code = '" : " or code = '")
                    .append(codes.get(i))
                    .append("'");
        }
        return  whereSql.toString();
    }
}
