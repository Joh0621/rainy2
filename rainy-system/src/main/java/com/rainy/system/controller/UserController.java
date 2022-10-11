package com.rainy.system.controller;

import cn.dev33.satoken.annotation.SaCheckPermission;
import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rainy.framework.common.IdNamesParam;
import com.rainy.framework.common.Result;
import com.rainy.framework.constant.CharConstants;
import com.rainy.framework.constant.OpType;
import com.rainy.framework.utils.WebUtils;
import com.rainy.framework.validation.Group;
import com.rainy.framework.annotation.Log;
import com.rainy.system.entity.User;
import com.rainy.system.param.user.PasswordUpdateParam;
import com.rainy.system.service.OrgService;
import com.rainy.system.service.UserRoleRelService;
import com.rainy.system.service.UserService;
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
 * rainy
 *
 * @author Created by renguangli at 2022/9/14 0014 6:37
 */
@RestController
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;
    private final UserRoleRelService userRoleRelService;
    private final OrgService orgService;

    @GetMapping("/users")
    @SaCheckPermission("user:query")
    @Log(module = "用户管理", type = OpType.QUERY, detail = "'查询了用户列表第' + #page.current + '页,每页' + #page.size + '条数据'", resSaved = false)
    public Page<User> list(Page<User> page, User param) {
        List<Long> orgIds = orgService.getChildrenIds(param.getOrgId());
        return userService.lambdaQuery()
                .in(!orgIds.isEmpty(), User::getOrgId, orgIds)
                .likeRight(StrUtil.isNotBlank(param.getUsername()), User::getUsername, param.getUsername())
                .page(page);
    }

    @GetMapping("/users/export")
    @SaCheckPermission("user:export")
    @Log(module = "用户管理", type = OpType.EXPORT, detail = "导出了用户列表")
    public void export(HttpServletResponse response) throws IOException {
        List<User> users = userService.list();
        WebUtils.exportExcel(response, users, "users.xls");
    }

    @PostMapping("/user")
    @SaCheckPermission("user:add")
    @Log(module = "用户管理", type = OpType.ADD, detail = "'新增了用户[' + #param.username + '].'")
    public Boolean save(@RequestBody @Validated(Group.Add.class) User param) {
        return userService.save(param);
    }

    @PostMapping("/users")
    @SaCheckPermission("user:del")
    @Log(module = "用户管理", type = OpType.DEL, detail = "'删除了用户[' + #param.names + '].'")
    public Boolean remove(@RequestBody @Validated(Group.Del.class) IdNamesParam param) {
        return userService.removeBatchByIds(param.getIds());
    }

    @PostMapping("/user/update")
    @SaCheckPermission("user:update")
    @Log(module = "用户管理", type = OpType.UPDATE, detail = "'更新了用户[' + #param.username + '].'")
    public Boolean update(@RequestBody @Validated(Group.Edit.class) User param) {
        return userService.updateById(param);
    }

    @PostMapping("/user/password/reset")
    @SaCheckPermission("user:resetPassword")
    @Log(module = "用户管理", type = OpType.ADD, detail = "'重置了用户[' + #param.username + ']的密码'")
    public Boolean resetPassword(@RequestBody @Validated PasswordUpdateParam param) {
        return userService.lambdaUpdate()
                .eq(User::getUsername, param.getUsername())
                .update(param.convert());
    }

    @GetMapping("/user/roleIds")
    @Log(module = "用户管理", type = OpType.QUERY, detail = "'查询了用户[' + #param.name + ']拥有的角色列表'")
    public List<Long> listRoleIdsByUserId(IdNamesParam param) {
        return userRoleRelService.listRoleIdsByUserId(param.getId());
    }

    @PostMapping("/user/roles/assign")
    @SaCheckPermission("user:assignRole")
    @Log(module = "用户管理", type = OpType.ADD, detail = "'给用户[' + #param.name + ']分配了角色[' + #param.names + '].'")
    public Boolean assignRoles(@RequestBody @Validated(Group.ASSIGN.class) IdNamesParam param) {
        return userRoleRelService.assignRoles(param.getId(), param.getIds());
    }

    @GetMapping("/users/online")
    @SaCheckPermission("onlineUser:query")
    @Log(module = "在线用户", type = OpType.QUERY, detail = "'查询了在线用户第' + #page.current + '页.每页' + #page.size + '条数据'")
    public Page<User> onlineUsers(Page<User> page, String username, String nickName){
        List<String> sessionIds = StpUtil.searchSessionId(CharConstants.EMPTY, -1, 0, true);
        if (sessionIds.isEmpty()) {
            return page;
        }
        List<String> userIds = sessionIds.stream()
                .map(v -> StrUtil.subAfter(v, CharConstants.COLON, true)).toList();
        return userService.lambdaQuery()
                .likeRight(StrUtil.isNotBlank(username), User::getUsername, username)
                .likeRight(StrUtil.isNotBlank(nickName), User::getNickName, username)
                .in(User::getId, userIds)
                .page(page);
    }

    @PostMapping("/user/kickOut")
    @SaCheckPermission("onlineUser:kickOut")
    @Log(module = "在线用户", type = OpType.DEL, detail = "'下线了用户[' + #param.names + '].'")
    public Result<Boolean> kickOut(@RequestBody @Valid IdNamesParam param){
        param.getIds().forEach(StpUtil::kickout);
        return Result.ok();
    }

}
