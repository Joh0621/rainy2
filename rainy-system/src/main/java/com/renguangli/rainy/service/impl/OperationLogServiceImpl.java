package com.renguangli.rainy.service.impl;

import com.renguangli.rainy.entity.OperationLog;
import com.renguangli.rainy.mapper.OperationLogMapper;
import com.renguangli.rainy.service.OperationLogService;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/5 17:17
 */
@Service
public class OperationLogServiceImpl extends BaseServiceImpl<OperationLogMapper, OperationLog> implements OperationLogService {

    @Async
    @Override
    public void asyncSave(OperationLog operationLog) {
        this.save(operationLog);
    }

}
