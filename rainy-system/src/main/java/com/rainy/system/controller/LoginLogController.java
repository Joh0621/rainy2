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
import com.rainy.system.entity.LoginLog;
import com.rainy.system.service.LoginLogService;
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
public class LoginLogController {

    private final LoginLogService loginLogService;

    @GetMapping("/loginLogs")
    @SaCheckPermission("loginLog:query")
    @Log(module = "登陆日志管理", type = OpType.QUERY, detail = "'查询了登陆日志列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    public Page<LoginLog> list(Page<LoginLog> page, String username,
                               @DateTimeFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS) LocalDateTime startTime,
                               @DateTimeFormat(pattern = DateUtils.YYYY_MM_DD_HH_MM_SS) LocalDateTime endTime) {
        return loginLogService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(username), LoginLog::getUsername, username)
                .between(!Objects.isNull(startTime) && !Objects.isNull(endTime), LoginLog::getDatetime, startTime, endTime)
                .page(page);
    }

    @GetMapping("/loginLogs/export")
    @SaCheckPermission("loginLog:export")
    @Log(module = "登陆日志管理", type = OpType.EXPORT, detail = "导出了登陆日志列表")
    public void export(HttpServletResponse response) throws IOException {
        List<LoginLog> loginLogs = loginLogService.list();
        WebUtils.exportExcel(response, loginLogs, "loginLogs.xls");
    }

    @PostMapping("/loginLogs")
    @SaCheckPermission("loginLog:del")
    @Log(module = "登陆日志管理", type = OpType.DEL, detail = "'删除了登陆日志[' + #param.names + '].'")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return loginLogService.removeBatchByIds(param.getIds());
    }

}
