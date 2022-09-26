package com.rainy.base.service;

import com.rainy.base.entity.OperationLog;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/13 20:01
 */
public interface OperationLogService extends BaseService<OperationLog> {

    void asyncSave(OperationLog operationLog);

}
