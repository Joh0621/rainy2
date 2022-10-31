package com.rainy.dmplatfrom.service.impl;

import com.rainy.dmplatfrom.entity.PointData;
import com.rainy.dmplatfrom.service.PointDataService;
import lombok.RequiredArgsConstructor;
import org.apache.iotdb.session.pool.SessionPool;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/10/31 22:02
 */
@Service
@RequiredArgsConstructor
public class PointDataServiceImpl implements PointDataService {

    private final SessionPool sessionPool;

    @Override
    public List<PointData> listPoints(List<String> codes) {
        List<String> columns = codes.stream()
                .map(code -> code.substring(8))
                .toList();
        String sql = "select time,last()";
//        sessionPool.executeQueryStatement()
        return null;
    }
}
