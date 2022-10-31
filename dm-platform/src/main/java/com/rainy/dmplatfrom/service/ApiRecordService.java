package com.rainy.dmplatfrom.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.rainy.dmplatfrom.entity.ApiRecord;
import com.rainy.dmplatfrom.entity.ApiRecordStatistics;

import java.util.List;
import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 22:41
 */
public interface ApiRecordService extends IService<ApiRecord> {

    void asyncSave(ApiRecord apiRecord);
    Map<String, ApiRecordStatistics> statistics();
}
