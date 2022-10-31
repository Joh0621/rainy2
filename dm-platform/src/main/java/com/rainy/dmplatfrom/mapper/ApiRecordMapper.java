package com.rainy.dmplatfrom.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.rainy.dmplatfrom.entity.ApiRecord;
import com.rainy.dmplatfrom.entity.ApiRecordStatistics;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 22:40
 */
public interface ApiRecordMapper extends BaseMapper<ApiRecord> {

    @Select("select api_code,count(*) totalCount, avg(response_time) avgResponseTime, sum(data_size) totalDataSize " +
            "from biz_api_record group by api_code")
    List<ApiRecordStatistics> statistics();
}
