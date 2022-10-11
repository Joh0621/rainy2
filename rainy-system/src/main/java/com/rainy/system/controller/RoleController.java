package com.rainy.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.WebUtils;
import com.rainy.framework.validation.Group;
import com.rainy.framework.annotation.Log;
import com.rainy.system.entity.Role;
import com.rainy.system.entity.RoleMenuRel;
import com.rainy.system.service.RoleMenuRelService;
import com.rainy.system.service.RoleService;
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

    @GetMapping("/roles")
//    @SaCheckPermission("role:query")
    @Log(module = "角色管理", type = OpType.QUERY, detail = "'查询了角色列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    public Page<Role> list(Page<Role> page, Role param) {
        return roleService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(param.getName()), Role::getName, param.getName())
                .likeRight(StrUtil.isNotBlank(param.getCode()), Role::getCode, param.getCode())
                .page(page);
    }

    @GetMapping("/roles/export")
//    @SaCheckPermission("role:export")
    @Log(module = "角色管理", type = OpType.EXPORT, detail = "导出了角色列表")
    public void export(HttpServletResponse response) throws IOException {
        List<Role> roles = roleService.list();
        WebUtils.exportExcel(response, roles, "roles.xls");
    }

    @PostMapping("/role")
//    @SaCheckPermission("role:add")
    @Log(module = "角色管理", type = OpType.ADD, detail = "'新增了角色[' + #param.name + '].'")
    public Boolean save(@RequestBody @Validated(Group.Add.class) Role param) {
        return roleService.save(param);
    }

    @PostMapping("/roles")
//    @SaCheckPermission("role:del")
    @Log(module = "角色管理", type = OpType.DEL, detail = "'删除了角色[' + #param.names + '].'")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return roleService.removeBatchByIds(param.getIds());
    }

    @PostMapping("/role/update")
    @SaCheckPermission("role:update")
    @Log(module = "角色管理", type = OpType.UPDATE, detail = "'更新了角色[' + #param.name + '].'")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) Role param) {
        return roleService.updateById(param);
    }

    @PostMapping("/role/menus/assign")
//    @SaCheckPermission("role:assignMenus")
    @Log(module = "角色管理", type = OpType.UPDATE, detail = "'给角色[' + #param.name + ']分配了菜单[' + #param.names + ']'")
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

    @GetMapping("/role/menuIds")
    @Log(module = "角色管理", type = OpType.UPDATE, detail = "'查询了角色[' + #param.name + ']拥有的菜单id列表'")
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
