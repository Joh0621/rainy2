package com.rainy.dmplatfrom.service;

import com.rainy.dmplatfrom.entity.PointData;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 22:02
 */
public interface PointDataService {

    List<PointData> listPoints(List<String> codes);
}
