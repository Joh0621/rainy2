package com.renguangli.rainy.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.renguangli.rainy.common.annotation.Log;
import com.renguangli.rainy.common.constant.OperationType;
import com.renguangli.rainy.common.param.IdNamesParam;
import com.renguangli.rainy.common.utils.ExcelUtils;
import com.renguangli.rainy.entity.Menu;
import com.renguangli.rainy.service.MenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

/**
 * 菜单控制器
 *
 * @author created by renguangli at 2022/9/1 17:58
 */
@RestController
@RequiredArgsConstructor
public class MenuController {

    private final MenuService menuService;

    @Log(module = "菜单管理", type = OperationType.QUERY, detail = "'查询了菜单列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    @GetMapping("/menus")
    public Page<Menu> list(Page<Menu> page, Menu param){
        return menuService.lambdaQuery()
                .eq(StrUtil.isNotBlank(param.getName()), Menu::getName, param.getName())
                .eq(Objects.nonNull(param.getType()), Menu::getType, param.getType())
                .page(page);
    }

    @Log(module = "菜单管理", type = OperationType.EXPORT, detail = "导出了菜单列表")
    @GetMapping("/menus/export")
    public void export(HttpServletResponse response) throws IOException {
        List<Menu> configs = menuService.list();
        ExcelUtils.export(response, configs, "menus.xls");
    }

    @Log(module = "菜单管理", type = OperationType.ADD, detail = "'新增了菜单[' + #param.name + '].'")
    @PostMapping("/menu")
    public Boolean save(@Valid @RequestBody Menu param) {
        return menuService.save(param);
    }

    @Log(module = "菜单管理", type = OperationType.DEL, detail = "'删除了菜单[' + #param.names + '].'")
    @PostMapping("/menus")
    public Boolean remove(@RequestBody @Valid IdNamesParam param) {
        return menuService.removeBatchByIds(param.getIds());
    }

    @Log(module = "菜单管理", type = OperationType.UPDATE, detail = "'更新了菜单[' + #param.name + '].'")
    @PostMapping("/menu/update")
    public Boolean update(@Valid @RequestBody Menu param) {
        return menuService.updateById(param);
    }

}
