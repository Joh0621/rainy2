package com.rainy.base.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.base.aop.Log;
import com.rainy.base.common.constant.OpType;
import com.rainy.base.common.param.IdNamesParam;
import com.rainy.base.common.utils.ExcelUtils;
import com.rainy.base.common.validation.Group;
import com.rainy.base.entity.Config;
import com.rainy.base.service.ConfigService;
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
public class ConfigController {

    private final ConfigService configService;

    @GetMapping("/configs")
    @SaCheckPermission("config:query")
    @Log(module = "配置管理", type = OpType.QUERY, detail = "'查询了配置列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    public Page<Config> list(Page<Config> page, Config param) {
        return configService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(param.getName()), Config::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Config::getCode, param.getCode())
                .eq(StrUtil.isNotBlank(param.getCategoryCode()), Config::getCategoryCode, param.getCategoryCode())
                .page(page);
    }

    @GetMapping("/configs/export")
    @SaCheckPermission("config:export")
    @Log(module = "配置管理", type = OpType.EXPORT, detail = "导出了配置列表")
    public void export(HttpServletResponse response) throws IOException {
        List<Config> configs = configService.list();
        ExcelUtils.export(response, configs, "configs.xls");
    }

    @PostMapping("/config")
    @SaCheckPermission("config:add")
    @Log(module = "配置管理", type = OpType.ADD, detail = "'新增了配置[' + #param.name + '].'")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Config param) {
        return configService.save(param);
    }

    @PostMapping("/configs")
    @SaCheckPermission("config:del")
    @Log(module = "配置管理", type = OpType.DEL, detail = "'删除了配置[' + #param.names + '].'")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return configService.lambdaUpdate()
                .in(Config::getId, param.getIds())
                .set(Config::getDelFlag, true)
                .update();
    }

    @PostMapping("/config/update")
    @SaCheckPermission("config:update")
    @Log(module = "配置管理", type = OpType.UPDATE, detail = "'更新了配置[' + #param.name + '].'")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) Config param) {
        return configService.update(param);
    }

}
