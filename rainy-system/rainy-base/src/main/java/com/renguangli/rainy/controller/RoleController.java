package com.renguangli.rainy.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.renguangli.rainy.aop.Log;
import com.renguangli.rainy.common.constant.OperationType;
import com.renguangli.rainy.common.param.IdNamesParam;
import com.renguangli.rainy.common.utils.ExcelUtils;
import com.renguangli.rainy.common.validation.Group;
import com.renguangli.rainy.entity.Role;
import com.renguangli.rainy.service.RoleService;
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
public class RoleController {

    private final RoleService roleService;

    @Log(module = "角色管理", type = OperationType.QUERY, detail = "'查询了角色列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    @GetMapping("/roles")
    public Page<Role> list(Page<Role> page, Role param) {
        return roleService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(param.getName()), Role::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Role::getCode, param.getCode())
                .page(page);
    }

    @Log(module = "角色管理", type = OperationType.EXPORT, detail = "导出了角色列表")
    @GetMapping("/roles/export")
    public void export(HttpServletResponse response) throws IOException {
        List<Role> configs = roleService.list();
        ExcelUtils.export(response, configs, "roles.xls");
    }

    @Log(module = "角色管理", type = OperationType.ADD, detail = "'新增了角色[' + #param.name + '].'")
    @PostMapping("/role")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Role param) {
        return roleService.save(param);
    }

    @Log(module = "角色管理", type = OperationType.DEL, detail = "'删除了角色[' + #param.names + '].'")
    @PostMapping("/roles")
    public Boolean remove(@RequestBody @Valid IdNamesParam param) {
        return roleService.removeBatchByIds(param.getIds());
    }

    @Log(module = "角色管理", type = OperationType.UPDATE, detail = "'更新了角色[' + #param.name + '].'")
    @PostMapping("/role/update")
    public Boolean update(@Valid @RequestBody Role param) {
        return roleService.updateById(param);
    }

}
