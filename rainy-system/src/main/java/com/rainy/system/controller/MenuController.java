package com.rainy.system.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.ValidateUtils;
import com.rainy.framework.utils.WebUtils;
import com.rainy.framework.validation.Group;
import com.rainy.framework.annotation.Log;
import com.rainy.system.entity.Menu;
import com.rainy.system.service.MenuService;
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

    @Log(module = "菜单管理", type = OpType.QUERY, detail = "'查询了菜单树列表'", resSaved = false)
    @GetMapping("/menus/tree")
    public List <Menu> tree(Menu param) {
        return menuService.tree(param);
    }

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
        List<Menu> menus = menuService.list();
        WebUtils.exportExcel(response, menus, "menus.xls");
    }

    @Log(module = "菜单管理", type = OpType.ADD, detail = "'新增了菜单[' + #param.name + '].'")
    @PostMapping("/menu")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Menu param) {
        // todo 新增菜单时将父节点设置为半悬状态
        return menuService.save(param);
    }

    @Log(module = "菜单管理", type = OpType.DEL, detail = "'删除了菜单[' + #param.names + '].'")
    @PostMapping("/menus")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        boolean exists = menuService.lambdaQuery()
                .in(Menu::getParentId, param.getIds())
                .exists();
        ValidateUtils.isTrue(exists, "该菜单下有子菜单，请先删除子菜单!");
        return menuService.removeBatchByIds(param.getIds());
    }

    @Log(module = "菜单管理", type = OpType.UPDATE, detail = "'更新了菜单[' + #param.name + '].'")
    @PostMapping("/menu/update")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) Menu param) {
        return menuService.updateById(param);
    }

}
