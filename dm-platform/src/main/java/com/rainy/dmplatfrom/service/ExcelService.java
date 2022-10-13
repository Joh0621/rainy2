package com.rainy.dmplatfrom.service;

import com.rainy.dmplatfrom.entity.AllData;

import java.util.List;
import java.util.Map;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/13 17:39
 */
public interface ExcelService {

    void saveAll(List<Map<String, List<AllData>>> allData);
}
