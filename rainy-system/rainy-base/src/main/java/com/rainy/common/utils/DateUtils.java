package com.rainy.common.utils;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;

/**
 * 时间处理工具类
 *
 * @author renguangli
 * @date 2022/9/1 17:26
 */
public final class DateUtils {

    public static final String YYYY_MM_DD = "yyyy-MM-dd";
    public static final String MM_DD_HH_MM = "MM-dd HH:mm";
    public static final String YYYY_MM_DD_HH_MM = "yyyy-MM-dd HH:mm";
    public static final String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";
    private static final String ZONE_OFFSET_8 = "+8";

    public static String format(TemporalAccessor datetime) {
        return getDtf(YYYY_MM_DD_HH_MM_SS).format(datetime);
    }

    public static String format(TemporalAccessor datetime, String pattern) {
        return getDtf(pattern).format(datetime);
    }

    public static LocalDateTime parse(String datetime) {
        return LocalDateTime.parse(datetime, getDtf(YYYY_MM_DD_HH_MM_SS));
    }

    public static LocalDateTime parse(String datetime, String pattern) {
        return LocalDateTime.parse(datetime, getDtf(pattern));
    }

    public static DateTimeFormatter getDtf(String pattern) {
        return DateTimeFormatter.ofPattern(pattern);
    }

    public static LocalDateTime get5Datetime() {
        return getDatetime(5);
    }

    public static LocalDateTime get15Datetime() {
        return getDatetime(15);
    }

    public static LocalDateTime getDatetime(int interval) {
        LocalDateTime now = LocalDateTime.now();
        int minute = now.getMinute();
        int i = minute / interval * interval;
        return LocalDateTime.of(now.getYear(), now.getMonthValue(), now.getDayOfMonth(),
                now.getHour(), i, 0);
    }

    public static long toTimestamp(LocalDateTime datetime) {
        return toInstant(datetime).getEpochSecond();
    }

    public static Instant toInstant(LocalDateTime datetime) {
        return datetime.toInstant(ZoneOffset.of(ZONE_OFFSET_8));
    }

}
