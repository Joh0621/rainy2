package com.rainy.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.aop.Log;
import com.rainy.common.constant.OpType;
import com.rainy.common.param.IdNamesParam;
import com.rainy.common.utils.ExcelUtils;
import com.rainy.common.validation.Group;
import com.rainy.entity.LoginLog;
import com.rainy.service.LoginLogService;
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
public class LoginLogController {

    private final LoginLogService loginLogService;

    @Log(module = "登陆日志管理", type = OpType.QUERY, detail = "'查询了登陆日志列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    @GetMapping("/loginLogs")
    public Page<LoginLog> list(Page<LoginLog> page, LoginLog param) {
        return loginLogService.page(page);
    }

    @Log(module = "登陆日志管理", type = OpType.EXPORT, detail = "导出了登陆日志列表")
    @GetMapping("/loginLogs/export")
    public void export(HttpServletResponse response) throws IOException {
        List<LoginLog> configs = loginLogService.list();
        ExcelUtils.export(response, configs, "loginLogs.xls");
    }

    @Log(module = "登陆日志管理", type = OpType.DEL, detail = "'删除了登陆日志[' + #param.names + '].'")
    @PostMapping("/loginLogs")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return loginLogService.removeBatchByIds(param.getIds());
    }

}