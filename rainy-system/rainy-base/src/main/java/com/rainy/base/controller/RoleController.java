package com.rainy.base.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.base.aop.Log;
import com.rainy.base.common.constant.OpType;
import com.rainy.base.common.param.IdNamesParam;
import com.rainy.base.common.utils.ExcelUtils;
import com.rainy.base.common.validation.Group;
import com.rainy.base.entity.Role;
import com.rainy.base.entity.RoleMenuRel;
import com.rainy.base.service.RoleMenuRelService;
import com.rainy.base.service.RoleService;
import lombok.RequiredArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
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
    private final RoleMenuRelService roleMenuRelService;

    @Log(module = "角色管理", type = OpType.QUERY, detail = "'查询了角色列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    @GetMapping("/roles")
    public Page<Role> list(Page<Role> page, Role param) {
        return roleService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(param.getName()), Role::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Role::getCode, param.getCode())
                .page(page);
    }

    @Log(module = "角色管理", type = OpType.EXPORT, detail = "导出了角色列表")
    @GetMapping("/roles/export")
    public void export(HttpServletResponse response) throws IOException {
        List<Role> configs = roleService.list();
        ExcelUtils.export(response, configs, "roles.xls");
    }

    @Log(module = "角色管理", type = OpType.ADD, detail = "'新增了角色[' + #param.name + '].'")
    @PostMapping("/role")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Role param) {
        return roleService.save(param);
    }

    @Log(module = "角色管理", type = OpType.DEL, detail = "'删除了角色[' + #param.names + '].'")
    @PostMapping("/roles")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return roleService.removeBatchByIds(param.getIds());
    }

    @Log(module = "角色管理", type = OpType.UPDATE, detail = "'更新了角色[' + #param.name + '].'")
    @PostMapping("/role/update")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) Role param) {
        return roleService.updateById(param);
    }

    @Log(module = "角色管理", type = OpType.UPDATE, detail = "'给角色[' + #param.name + ']分配了菜单[' + #param.names + ']'")
    @PostMapping("/role/menus/assign")
    public Boolean assignMenus(@RequestBody @Validated(Group.ASSIGN.class) IdNamesParam param) {
        List<RoleMenuRel> roleMenuRelList = new ArrayList<>();
        List<RoleMenuRel> roleMenuRels = param.getIds().stream()
                .map(menuId -> new RoleMenuRel(param.getId(), menuId, false))
                .toList();
        List<RoleMenuRel> halfRoleMenuRels = param.getHalfIds().stream()
                .map(menuId -> new RoleMenuRel(param.getId(), menuId, true))
                .toList();
        roleMenuRelList.addAll(roleMenuRels);
        roleMenuRelList.addAll(halfRoleMenuRels);
        return roleService.assignMenus(param.getId(), roleMenuRelList);
    }

    @Log(module = "角色管理", type = OpType.UPDATE, detail = "'查询了角色[' + #param.name + ']拥有的菜单'")
    @GetMapping("/role/menuIds")
    public List<Long> getMenuIdsByRoleId(IdNamesParam param) {
        List<RoleMenuRel> roleMenuRels = roleMenuRelService.lambdaQuery()
                .select(RoleMenuRel::getMenuId)
                .eq(RoleMenuRel::getRoleId, param.getId())
                .eq(RoleMenuRel::getHalf, false)
                .list();
        return roleMenuRels.stream()
                .map(RoleMenuRel::getMenuId)
                .toList();
    }

}
