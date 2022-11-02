package com.rainy.dmplatfrom.influxdb;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.influxdb.InfluxDB;
import org.influxdb.annotation.Measurement;
import org.influxdb.dto.BatchPoints;
import org.influxdb.dto.Query;
import org.influxdb.impl.InfluxDBMapper;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

/**
 * rainy
 *
 * @author renguangli
 * @date 2022/8/25 11:26
 */
@Slf4j
@Component
public class InfluxdbClient extends InfluxDBMapper {

    private final InfluxDB influxDB;

    public InfluxdbClient(InfluxDB influxDB) {
        super(influxDB);
        this.influxDB = influxDB;
    }

    public <T> List<T> query(String command, Class<T> clazz){
        log.info("influxSQL: {}", command);
        Query query = new Query(command, clazz.getAnnotation(Measurement.class).database());
        return this.query(query, clazz);
    }

    public InfluxDB influxDB(){
        return influxDB;
    }

}
