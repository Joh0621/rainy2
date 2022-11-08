package com.rainy.job.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.rainy.job.entity.TaskLog;
import org.apache.ibatis.annotations.Update;

/**
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/11/07 15:26
 */
public interface TaskLogMapper extends BaseMapper<TaskLog> {

    @Update("truncate table t_task_log")
    boolean clear();
}
