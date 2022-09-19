package com.renguangli.rainy.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.renguangli.rainy.aop.Log;
import com.renguangli.rainy.common.constant.OperationType;
import com.renguangli.rainy.common.param.IdNamesParam;
import com.renguangli.rainy.common.utils.ExcelUtils;
import com.renguangli.rainy.common.validation.Group;
import com.renguangli.rainy.entity.Config;
import com.renguangli.rainy.service.ConfigService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
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

    @Log(module = "配置管理", type = OperationType.QUERY, detail = "'查询了配置列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    @GetMapping("/configs")
    public Page<Config> list(Page<Config> page, Config param) {
        return configService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(param.getName()), Config::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Config::getCode, param.getCode())
                .eq(StrUtil.isNotBlank(param.getCategoryCode()), Config::getCategoryCode, param.getCategoryCode())
                .page(page);
    }

    @Log(module = "配置管理", type = OperationType.EXPORT, detail = "导出了配置列表")
    @GetMapping("/configs/export")
    public void export(HttpServletResponse response) throws IOException {
        List<Config> configs = configService.list();
        ExcelUtils.export(response, configs, "configs.xls");
    }

    @Log(module = "配置管理", type = OperationType.ADD, detail = "'新增了配置[' + #param.name + '].'")
    @PostMapping("/config")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Config param) {
        return configService.save(param);
    }

    @Log(module = "配置管理", type = OperationType.DEL, detail = "'删除了配置[' + #param.names + '].'")
    @PostMapping("/configs")
    public Boolean remove(@RequestBody @Valid IdNamesParam param) {
        return configService.lambdaUpdate()
                .in(Config::getId, param.getIds())
                .set(Config::getDelFlag, true)
                .update();
    }

    @Log(module = "配置管理", type = OperationType.UPDATE, detail = "'更新了配置[' + #param.name + '].'")
    @PostMapping("/config/update")
    public Boolean update(@Valid @RequestBody Config param) {
        return configService.updateById(param);
    }

}
