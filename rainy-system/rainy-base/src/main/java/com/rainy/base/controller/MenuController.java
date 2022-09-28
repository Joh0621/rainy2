package com.rainy.base.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.base.aop.Log;
import com.rainy.base.common.constant.OpType;
import com.rainy.base.common.param.IdNamesParam;
import com.rainy.base.common.utils.ExcelUtils;
import com.rainy.base.common.validation.Group;
import com.rainy.base.entity.Menu;
import com.rainy.base.service.MenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
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

    @Log(module = "菜单管理", type = OpType.QUERY, detail = "'查询了菜单列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    @GetMapping("/menus")
    public Page<Menu> list(Page<Menu> page, Menu param) {
        return menuService.lambdaQuery()
                .eq(StrUtil.isNotBlank(param.getName()), Menu::getName, param.getName())
                .eq(Objects.nonNull(param.getType()), Menu::getType, param.getType())
                .page(page);
    }

    @Log(module = "菜单管理", type = OpType.EXPORT, detail = "导出了菜单列表")
    @GetMapping("/menus/export")
    public void export(HttpServletResponse response) throws IOException {
        List<Menu> configs = menuService.list();
        ExcelUtils.export(response, configs, "menus.xls");
    }

    @Log(module = "菜单管理", type = OpType.ADD, detail = "'新增了菜单[' + #param.name + '].'")
    @PostMapping("/menu")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Menu param) {
        return menuService.save(param);
    }

    @Log(module = "菜单管理", type = OpType.DEL, detail = "'删除了菜单[' + #param.names + '].'")
    @PostMapping("/menus")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return menuService.removeBatchByIds(param.getIds());
    }

    @Log(module = "菜单管理", type = OpType.UPDATE, detail = "'更新了菜单[' + #param.name + '].'")
    @PostMapping("/menu/update")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) Menu param) {
        return menuService.updateById(param);
    }

}
