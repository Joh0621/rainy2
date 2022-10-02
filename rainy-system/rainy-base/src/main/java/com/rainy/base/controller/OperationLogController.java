package com.rainy.base.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.base.aop.Log;
import com.rainy.base.common.constant.OpType;
import com.rainy.base.common.param.IdNamesParam;
import com.rainy.base.common.utils.ExcelUtils;
import com.rainy.base.common.validation.Group;
import com.rainy.base.entity.LoginLog;
import com.rainy.base.entity.OperationLog;
import com.rainy.base.service.OperationLogService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * data-middle-platform
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
    public Page<OperationLog> list(Page<OperationLog> page, LoginLog param) {
        return operationLogService.page(page);
    }

    @GetMapping("/operationLogs/export")
    @SaCheckPermission("operationLog:export")
    @Log(module = "操作日志", type = OpType.EXPORT, detail = "导出了操作日志列表")
    public void export(HttpServletResponse response) throws IOException {
        List<OperationLog> operationLogs = operationLogService.list();
        ExcelUtils.export(response, operationLogs, "operationLogs.xls");
    }

    @Log(module = "操作日志", type = OpType.DEL, detail = "'删除了操作日志[' + #param.names + '].'")
    @PostMapping("/operationLogs")
    @SaCheckPermission("operationLog:del")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return operationLogService.removeBatchByIds(param.getIds());
    }

}
