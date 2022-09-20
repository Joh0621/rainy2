package com.renguangli.rainy.controller;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.renguangli.rainy.aop.Log;
import com.renguangli.rainy.common.constant.OperationType;
import com.renguangli.rainy.common.param.IdNamesParam;
import com.renguangli.rainy.common.utils.ExcelUtils;
import com.renguangli.rainy.common.validation.Group;
import com.renguangli.rainy.entity.User;
import com.renguangli.rainy.service.UserRoleRelService;
import com.renguangli.rainy.service.UserService;
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
 * data-middle-platform
 *
 * @author Created by renguangli at 2022/9/14 0014 6:37
 */
@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final UserRoleRelService userRoleRelService;

    @Log(module = "用户管理", type = OperationType.QUERY, detail = "'查询了用户列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    @GetMapping("/users")
    public Page<User> list(Page<User> page, User param) {
        return userService.lambdaQuery()
                .eq(!Objects.isNull(param.getOrgId()), User::getOrgId, param.getOrgId())
                .likeRight(StrUtil.isNotBlank(param.getUsername()), User::getUsername, param.getUsername())
                .page(page);
    }

    @Log(module = "用户管理", type = OperationType.EXPORT, detail = "导出了用户列表")
    @GetMapping("/users/export")
    public void export(HttpServletResponse response) throws IOException {
        List<User> configs = userService.list();
        ExcelUtils.export(response, configs, "users.xls");
    }

    @Log(module = "用户管理", type = OperationType.ADD, detail = "'新增了用户[' + #param.name + '].'")
    @PostMapping("/user")
    public Boolean save(@RequestBody @Validated(Group.Add.class) User param) {
        return userService.save(param);
    }

    @Log(module = "用户管理", type = OperationType.DEL, detail = "'删除了用户[' + #param.names + '].'")
    @PostMapping("/users")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return userService.removeBatchByIds(param.getIds());
    }

    @Log(module = "用户管理", type = OperationType.UPDATE, detail = "'更新了用户[' + #param.name + '].'")
    @PostMapping("/user/update")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) User param) {
        return userService.updateById(param);
    }

    @Log(module = "用户管理", type = OperationType.QUERY, detail = "'查询了用户[' + #param.name + ']拥有的角色列表'")
    @GetMapping("/user/roleIds")
    public List<Long> listRoleIdsByUserId(IdNamesParam param) {
        return userRoleRelService.listRoleIdsByUserId(param.getId());
    }

    @Log(module = "用户管理", type = OperationType.ADD, detail = "'给用户[' + #param.name + ']分配了角色[' + #param.names + '].'")
    @PostMapping("/user/roles/assign")
    public Boolean assignRoles(@RequestBody @Validated(Group.ASSIGN.class) IdNamesParam param) {
        return userRoleRelService.assignRoles(param.getId(), param.getIds());
    }

}
