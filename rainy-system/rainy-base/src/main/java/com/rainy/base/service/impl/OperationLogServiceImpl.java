package com.rainy.base.service.impl;

import com.rainy.base.entity.OperationLog;
import com.rainy.base.mapper.OperationLogMapper;
import com.rainy.base.service.OperationLogService;
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
