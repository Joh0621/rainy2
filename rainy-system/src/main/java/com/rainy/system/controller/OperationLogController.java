package com.rainy.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.framework.annotation.Log;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.DateUtils;
import com.rainy.framework.utils.WebUtils;
import com.rainy.framework.validation.Group;
import com.rainy.system.entity.OperationLog;
import com.rainy.system.service.OperationLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

/**
 * rainy
 *
 * @author Created by renguangli at 2022/9/5 17:07
 */
@RestController
@RequiredArgsConstructor
public class OperationLogController {

    private final OperationLogService operationLogService;

    @GetMapping("/operationLogs")
    @SaCheckPermission("operationLog:query")
    @Log(module = "操作日志", type = OpType.QUERY, detail = "'查询了操作日志列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    public Page<OperationLog> list(Page<OperationLog> page, String username,
                                   @DateTimeFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS) LocalDateTime startTime,
                                   @DateTimeFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS) LocalDateTime endTime) {
        return operationLogService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(username), OperationLog::getUsername, username)
                .between(!Objects.isNull(startTime) && !Objects.isNull(endTime), OperationLog::getDatetime, startTime, endTime)
                .page(page);
    }

    @GetMapping("/operationLogs/export")
    @SaCheckPermission("operationLog:export")
    @Log(module = "操作日志", type = OpType.EXPORT, detail = "导出了操作日志列表")
    public void export(HttpServletResponse response) throws IOException {
        List<OperationLog> operationLogs = operationLogService.list();
        WebUtils.exportExcel(response, operationLogs, "operationLogs.xls");
    }

    @Log(module = "操作日志", type = OpType.DEL, detail = "'删除了操作日志[' + #param.ids + '].'")
    @PostMapping("/operationLogs")
    @SaCheckPermission("operationLog:del")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return operationLogService.removeBatchByIds(param.getIds());
    }

}
