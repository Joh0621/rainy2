package com.rainy.dmplatfrom.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.rainy.dmplatfrom.entity.ApiRecord;
import com.rainy.dmplatfrom.entity.ApiRecordStatistics;
import com.rainy.dmplatfrom.mapper.ApiRecordMapper;
import com.rainy.dmplatfrom.service.ApiRecordService;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 22:41
 */
@Service
public class ApiRecordServiceImpl extends ServiceImpl<ApiRecordMapper, ApiRecord> implements ApiRecordService {

    @Override
    @Async
    public void asyncSave(ApiRecord apiRecord) {
        this.save(apiRecord);
    }

    @Override
    public List<ApiRecordStatistics> statistics() {
        return this.baseMapper.statistics();
    }

    @Override
    public Map<String, ApiRecordStatistics> statisticsByMap() {
        List<ApiRecordStatistics> statistics = this.baseMapper.statistics();
        Map<String, ApiRecordStatistics> map = new HashMap<>();
        statistics.forEach(r -> {
            map.put(r.getApiCode(), r);
        });
        return map;
    }
}
